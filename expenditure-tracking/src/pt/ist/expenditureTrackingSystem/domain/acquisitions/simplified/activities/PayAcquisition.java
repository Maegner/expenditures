package pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities;

import pt.ist.expenditureTrackingSystem.domain.RoleType;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcess;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessState;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessStateType;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.GenericAcquisitionProcessActivity;

public class PayAcquisition extends GenericAcquisitionProcessActivity {

    @Override
    protected boolean isAccessible(AcquisitionProcess process) {
	return userHasRole(RoleType.TREASURY);
    }

    @Override
    protected boolean isAvailable(AcquisitionProcess process) {
	return process.getAcquisitionProcessState().isInState(AcquisitionProcessStateType.FUNDS_ALLOCATED_PERMANENTLY);
    }

    @Override
    protected void process(AcquisitionProcess process, Object... objects) {
	process.getAcquisitionRequest().setPaymentReference((String)objects[0]);
	new AcquisitionProcessState(process, AcquisitionProcessStateType.ACQUISITION_PAYED);
    }

}
