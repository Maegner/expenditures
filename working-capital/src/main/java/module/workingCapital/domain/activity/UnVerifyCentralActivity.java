/*
 * @(#)UnVerifyActivity.java
 *
 * Copyright 2010 Instituto Superior Tecnico
 * Founding Authors: Luis Cruz
 * 
 *      https://fenix-ashes.ist.utl.pt/
 * 
 *   This file is part of the Working Capital Module.
 *
 *   The Working Capital Module is free software: you can
 *   redistribute it and/or modify it under the terms of the GNU Lesser General
 *   Public License as published by the Free Software Foundation, either version 
 *   3 of the License, or (at your option) any later version.
 *
 *   The Working Capital Module is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public License
 *   along with the Working Capital Module. If not, see <http://www.gnu.org/licenses/>.
 * 
 */
package module.workingCapital.domain.activity;

import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.i18n.BundleUtil;

import module.workflow.activities.ActivityInformation;
import module.workflow.activities.WorkflowActivity;
import module.workingCapital.domain.WorkingCapital;
import module.workingCapital.domain.WorkingCapitalInitialization;
import module.workingCapital.domain.WorkingCapitalProcess;
import module.workingCapital.util.Bundle;

/**
 * 
 * @author Luis Cruz
 * 
 */
public class UnVerifyCentralActivity extends WorkflowActivity<WorkingCapitalProcess, WorkingCapitalInitializationInformation> {

    @Override
    public String getLocalizedName() {
        return BundleUtil.getString(Bundle.WORKING_CAPITAL, "activity." + getClass().getSimpleName());
    }

    @Override
    public boolean isActive(final WorkingCapitalProcess process, final User user) {
        final WorkingCapital workingCapital = process.getWorkingCapital();
        if (workingCapital.isCentralVerifier(user)) {
            final WorkingCapitalInitialization workingCapitalInitialization = workingCapital.getWorkingCapitalInitialization();
            if (workingCapitalInitialization != null
                    && !workingCapitalInitialization.isCanceledOrRejected()
                    && (process.getCurrentOwner() == null || process.isTakenByCurrentUser())
                    && workingCapitalInitialization.getResponsibleForCentralVerification() != null
                    && workingCapitalInitialization.getResponsibleForUnitAuthorization() == null) {
                return true;
            }
        }
        return false;
    }

    @Override
    protected void process(final WorkingCapitalInitializationInformation activityInformation) {
        final WorkingCapitalInitialization workingCapitalInitialization = activityInformation.getWorkingCapitalInitialization();
        workingCapitalInitialization.unverifyCentral();
    }

    @Override
    public ActivityInformation<WorkingCapitalProcess> getActivityInformation(final WorkingCapitalProcess process) {
        return new WorkingCapitalInitializationInformation(process, this);
    }

    @Override
    public boolean isDefaultInputInterfaceUsed() {
        return true;
    }

    @Override
    public boolean isVisible() {
        return false;
    }

    @Override
    public boolean isUserAwarenessNeeded(final WorkingCapitalProcess process, final User user) {
        return false;
    }

}
