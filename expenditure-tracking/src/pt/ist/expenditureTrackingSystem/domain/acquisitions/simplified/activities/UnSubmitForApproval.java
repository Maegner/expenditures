package pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities;

import pt.ist.expenditureTrackingSystem.applicationTier.Authenticate.User;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcess;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessState;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessStateType;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.GenericAcquisitionProcessActivity;
import pt.ist.fenixWebFramework.security.UserView;

public class UnSubmitForApproval extends GenericAcquisitionProcessActivity {

    @Override
    protected boolean isAccessible(AcquisitionProcess process) {
	User user = UserView.getUser();
	return user != null && user.getPerson().equals(process.getRequestor());
    }

    @Override
    protected boolean isAvailable(AcquisitionProcess process) {
	return process.getAcquisitionProcessState().isPendingApproval() && !process.getAcquisitionRequest().isApprovedByAtLeastOneResponsible();
    }

    @Override
    protected void process(AcquisitionProcess process, Object... objects) {
	process.getAcquisitionRequest().unSubmitForFundsAllocation();
	new AcquisitionProcessState(process, AcquisitionProcessStateType.IN_GENESIS);
    }

}
