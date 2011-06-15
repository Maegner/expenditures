package pt.ist.expenditureTrackingSystem.domain.acquisitions;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import module.finance.domain.Supplier;
import module.workflow.activities.ActivityInformation;
import module.workflow.activities.WorkflowActivity;
import module.workflow.domain.WorkflowProcess;
import myorg.applicationTier.Authenticate;
import myorg.domain.User;
import myorg.domain.exceptions.DomainException;
import myorg.domain.util.Money;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.commons.ProjectFundAllocation;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.commons.ProjectFundAllocationActivityInformation;
import pt.ist.expenditureTrackingSystem.domain.dto.FundAllocationBean;
import pt.ist.expenditureTrackingSystem.domain.organization.AccountingUnit;
import pt.ist.expenditureTrackingSystem.domain.organization.Project;
import pt.ist.expenditureTrackingSystem.domain.organization.SubProject;
import pt.ist.expenditureTrackingSystem.domain.organization.Unit;
import pt.ist.fenixWebFramework.security.UserView;

public class ProjectAcquisitionFundAllocationRequest extends ProjectAcquisitionFundAllocationRequest_Base {

    public ProjectAcquisitionFundAllocationRequest(final UnitItem unitItem, final String processId, final String processUrl,
	    final Integer payingUnitNumber, final String payingAccountingUnit, final Money totalValue,
	    final Boolean finalFundAllocation) {
	super();
	setUnitItem(unitItem);
	setProcessId(processId);
	setProcessUrl(processUrl);
	setPayingUnitNumber(payingUnitNumber);
	setPayingAccountingUnit(payingAccountingUnit);
	setTotalValue(totalValue);
	setFinalFundAllocation(finalFundAllocation);
    }

    @Override
    public void registerFundAllocation(final String fundAllocationNumber, final String operatorUsername) {
	if (hasCancelFundAllocationRequest()) {
	    throw new DomainException("error.cannot.allocate.funds.because.request.has.been.canceled");
	}

	super.registerFundAllocation(fundAllocationNumber, operatorUsername);

	final UnitItem unitItem = getUnitItem();
	final ProjectFinancer financer = (ProjectFinancer) unitItem.getFinancer();

	final String projectFundAllocationIdsForAllUnitItems = financer.getProjectFundAllocationIdsForAllUnitItems();

	final PaymentProcess process = financer.getProcess();

	final String activityName = ProjectFundAllocation.class.getSimpleName();
	final WorkflowActivity activity = getActivity(process, activityName);

	final ActivityInformation activityInformation = activity.getActivityInformation(process);

	final ProjectFundAllocationActivityInformation information = (ProjectFundAllocationActivityInformation) activity
		.getActivityInformation(process);

	final List<FundAllocationBean> args;
	if (projectFundAllocationIdsForAllUnitItems == null) {
	    args = Collections.emptyList();
	} else {
	    final FundAllocationBean fundAllocationBean = new FundAllocationBean(financer);
	    fundAllocationBean.setFundAllocationId(projectFundAllocationIdsForAllUnitItems);
	    args = Collections.singletonList(fundAllocationBean);
	}
	information.setBeans(args);

	final myorg.applicationTier.Authenticate.UserView currentUserView = UserView.getUser();
	final User user = User.findByUsername(operatorUsername);
	if (user == null) {
	    throw new NullPointerException("No user found for: " + operatorUsername);
	}
	final myorg.applicationTier.Authenticate.UserView userView = Authenticate.authenticate(user);
	try {
	    UserView.setUser(userView);
	    activity.execute(information);
	} finally {
	    UserView.setUser(currentUserView);
	}
    }

    private <T extends WorkflowProcess> WorkflowActivity<T, ActivityInformation<T>> getActivity(final WorkflowProcess process,
	    final String activityName) {
	return process.getActivity(activityName);
    }

    @Override
    public String getQueryString() {
	if (getExternalRegistrationDate() == null) {
	    final UnitItem unitItem = getUnitItem();
	    final Unit unit = unitItem.getUnit();
	    final AccountingUnit accountingUnit = unitItem.getAccountingUnit();
	    final RequestItem item = unitItem.getItem();
	    final CPVReference cpvReference = item.getCPVReference();
	    final RequestWithPayment request = item.getRequest();
	    final Supplier supplier = getSupplier(request);

	    final Money shareValue = unitItem.getShareValue();
	    final Money shareValueWithVat = unitItem.getShareValueWithVat();
	    final Money shareVat = shareValueWithVat.subtract(shareValue);

	    final String q = insertQuery("CABIMENTOS", 
		    "INTERACT_ID", Long.valueOf(getInteractionId()),
		    "PROCESS_ID", getProcessId(),
		    "ITEM_ID", unitItem.getExternalId(),
		    "PROJ_ID", getProjectId(unit),
		    "PROJ_MEMBER", getSubProjectId(unit),
//		    "!!!FALTA A UNIDADE DE EXPLORAÇÃO", accountingUnit.getName().substring(0, 2),
		    "SUPPLIER_ID", supplier == null ? null : supplier.getGiafKey(),
		    "SUPPLIER_DOC_TYPE", supplier == null ? null : "Proposta",
		    "SUPPLIER_DOC_ID", supplier == null ? null : getProposalNumber(request),
		    "CPV_ID", cpvReference.getCode(),
		    "CPV_DESCRIPTION", cpvReference.getDescription(),
		    "MOV_DESCRIPTION", limitStringSize(Integer.toString(item.getUnitItemsCount()) + " - " + item.getDescription(), 4000),
		    "MOV_PCT_IVA", item.getVatValue(),
		    "MOV_VALUE", shareValue,
		    "MOV_VALUE_IVA", shareVat
	    	);
	    System.out.println(q);
	    return q;
	}
	final String q = selectQuery("CABIMENTOS", "INTERACT_ID", Long.valueOf(getInteractionId()),
		"MGP_DESP_ID", "MGP_DESP_TYPE", "MPG_DESP_DATE", "MGP_DESP_OPERATOR");
	return q;
    }

    @Override
    public void processResultSet(final ResultSet resultSet) throws SQLException {
	if (getExternalRegistrationDate() == null) {
	    registerOnExternalSystem();
	} else {
	    if (resultSet.next()) {
		final String fundAllocationNumber = resultSet.getString(1);
		final String operatorUsername = resultSet.getString(4);
		if (fundAllocationNumber != null && operatorUsername != null) {
		    System.out.println("fundAllocationNumber: " + fundAllocationNumber);
		    System.out.println("operatorUsername: " + operatorUsername);
		    registerFundAllocation(fundAllocationNumber, operatorUsername);
		}
	    }
	}
    }

    public String getProjectId(final Unit unit) {
	if (unit instanceof Project) {
	    final Project project = (Project) unit;
	    return project.getProjectCode();
	} else if (unit instanceof SubProject) {
	    final SubProject subProject = (SubProject) unit;
	    final Project project = (Project) subProject.getParentUnit();
	    return project.getProjectCode();
	}
	return null;
    }

    public String getSubProjectId(final Unit unit) {
	if (unit instanceof SubProject) {
	    final SubProject subProject = (SubProject) unit;
	    final Project project = (Project) subProject.getParentUnit();
	    final String projectName = project.getName();
	    final String description = subProject.getName().substring(projectName.length() + 3);
	    final int i = description.indexOf(" - ");
	    return description.substring(0, i);
	}
	return null;
    }

    private Supplier getSupplier(final RequestWithPayment request) {
	if (request instanceof AcquisitionRequest) {
	    final AcquisitionRequest acquisitionRequest = (AcquisitionRequest) request;
	    return acquisitionRequest.getSupplier();
	}
	return null;
    }

    private String getProposalNumber(final RequestWithPayment request) {
	if (request instanceof AcquisitionRequest) {
	    final AcquisitionRequest acquisitionRequest = (AcquisitionRequest) request;
	    final AcquisitionProcess process = acquisitionRequest.getProcess();
	    final AcquisitionProposalDocument acquisitionProposalDocument = process.getAcquisitionProposalDocument();
	    return acquisitionProposalDocument.getProposalId();
	}
	return null;
    }

    

}
