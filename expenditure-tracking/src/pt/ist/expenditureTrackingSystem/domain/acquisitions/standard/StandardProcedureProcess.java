package pt.ist.expenditureTrackingSystem.domain.acquisitions.standard;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import module.workflow.activities.ActivityInformation;
import module.workflow.activities.WorkflowActivity;
import module.workflow.domain.WorkflowProcess;
import myorg.domain.exceptions.DomainException;
import myorg.domain.util.Money;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessStateType;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionRequest;
import pt.ist.expenditureTrackingSystem.domain.dto.CreateAcquisitionProcessBean;
import pt.ist.expenditureTrackingSystem.domain.organization.Person;
import pt.ist.expenditureTrackingSystem.domain.organization.Supplier;
import pt.ist.expenditureTrackingSystem.domain.organization.Unit;
import pt.ist.fenixWebFramework.services.Service;

public class StandardProcedureProcess extends StandardProcedureProcess_Base {

    private static Money PROCESS_VALUE_LIMIT = new Money("75000");

    public StandardProcedureProcess() {
	super();
    }

    protected StandardProcedureProcess(final Person requester) {
	super();
	inGenesis();
	new AcquisitionRequest(this, requester);
    }

    protected StandardProcedureProcess(List<Supplier> suppliers, Person person) {
	super();
	inGenesis();
	new AcquisitionRequest(this, suppliers, person);
    }

    @Service
    public static StandardProcedureProcess createNewAcquisitionProcess(
	    final CreateAcquisitionProcessBean createAcquisitionProcessBean) {
	if (!isCreateNewProcessAvailable()) {
	    throw new DomainException("acquisitionProcess.message.exception.invalidStateToRun.create");
	}
	StandardProcedureProcess process = new StandardProcedureProcess(createAcquisitionProcessBean.getSuppliers(),
		createAcquisitionProcessBean.getRequester());
	process.getAcquisitionRequest().setRequestingUnit(createAcquisitionProcessBean.getRequestingUnit());
	if (createAcquisitionProcessBean.isRequestUnitPayingUnit()) {
	    final Unit unit = createAcquisitionProcessBean.getRequestingUnit();
	    process.getAcquisitionRequest().addFinancers(unit.finance(process.getAcquisitionRequest()));
	}

	return process;
    }

    @Override
    public Money getAcquisitionRequestValueLimit() {
	return PROCESS_VALUE_LIMIT;
    }

    @Override
    public List<AcquisitionProcessStateType> getAvailableStates() {
	List<AcquisitionProcessStateType> availableStates = new ArrayList<AcquisitionProcessStateType>();
	availableStates.add(AcquisitionProcessStateType.IN_GENESIS);
	availableStates.add(AcquisitionProcessStateType.SUBMITTED_FOR_APPROVAL);
	availableStates.add(AcquisitionProcessStateType.SUBMITTED_FOR_FUNDS_ALLOCATION);
	availableStates.add(AcquisitionProcessStateType.FUNDS_ALLOCATED_TO_SERVICE_PROVIDER);
	availableStates.add(AcquisitionProcessStateType.FUNDS_ALLOCATED);
	availableStates.add(AcquisitionProcessStateType.AUTHORIZED);
	availableStates.add(AcquisitionProcessStateType.INVITES_SENT);
	availableStates.add(AcquisitionProcessStateType.IN_NEGOTIATION);
	availableStates.add(AcquisitionProcessStateType.NEGOTIATION_ENDED);
	availableStates.add(AcquisitionProcessStateType.SELECTED_SERVICE_PROVIDER);
	availableStates.add(AcquisitionProcessStateType.DOCUMENTATION_INSERTED);
	availableStates.add(AcquisitionProcessStateType.ACQUISITION_PROCESSED);
	availableStates.add(AcquisitionProcessStateType.INVOICE_RECEIVED);
	availableStates.add(AcquisitionProcessStateType.SUBMITTED_FOR_CONFIRM_INVOICE);
	availableStates.add(AcquisitionProcessStateType.INVOICE_CONFIRMED);
	availableStates.add(AcquisitionProcessStateType.FUNDS_ALLOCATED_PERMANENTLY);
	availableStates.add(AcquisitionProcessStateType.ACQUISITION_PAYED);
	availableStates.add(AcquisitionProcessStateType.REJECTED);
	availableStates.add(AcquisitionProcessStateType.CANCELED);
	return availableStates;
    }

    public boolean isAppiableForYear(final int year) {
	throw new Error("not.implemented");
    }

    /*
     * TODO: Implement this methods correctly
     */
    public <T extends WorkflowActivity<? extends WorkflowProcess, ? extends ActivityInformation>> List<T> getActivities() {
	return Collections.EMPTY_LIST;
    }

    public boolean isActive() {
	return true;
    }
}
