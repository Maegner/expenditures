package pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities;

import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcess;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessState;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessStateType;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.GenericAcquisitionProcessActivity;

public class RemoveFundAllocation extends GenericAcquisitionProcessActivity {

    @Override
    protected boolean isAccessible(AcquisitionProcess process) {
	return process.isAccountingEmployee();
    }

    @Override
    protected boolean isAvailable(AcquisitionProcess process) {
	return checkActiveConditions(process) || checkCanceledConditions(process);
    }

    private boolean checkActiveConditions(AcquisitionProcess process) {
	return process.getAcquisitionProcessState().isInState(AcquisitionProcessStateType.FUNDS_ALLOCATED);
    }

    private boolean checkCanceledConditions(AcquisitionProcess process) {
	return process.getAcquisitionProcessState().isCanceled()
		&& process.getAcquisitionRequest().hasAllFundAllocationId();
    }

    @Override
    protected void process(AcquisitionProcess process, Object... objects) {
	process.getAcquisitionRequest().resetFundAllocationId();
	if (!process.getAcquisitionProcessState().isCanceled()) {
	    new AcquisitionProcessState(process, AcquisitionProcessStateType.FUNDS_ALLOCATED_TO_SERVICE_PROVIDER);
	} else {
	    if (!process.hasAllocatedFundsForAllProjectFinancers()) {
		new RemoveFundAllocationExpirationDate().execute(process);
	    }
	}
    }
}
