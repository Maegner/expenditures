<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<h2><bean:message key="link.view.organization" bundle="EXPENDITURE_RESOURCES"/></h2>
<br />
<logic:notPresent name="unit">
	<html:link action="/organization.do?method=prepareCreateUnit">
		<bean:message key="unit.link.create" bundle="ORGANIZATION_RESOURCES"/>
	</html:link>
</logic:notPresent>
<logic:present name="unit">
	<html:link action="/organization.do?method=prepareCreateUnit" paramId="unitOid" paramName="unit" paramProperty="OID">
		<bean:message key="unit.link.create" bundle="ORGANIZATION_RESOURCES"/>
	</html:link>
</logic:present>
<br/>
<br/>
<logic:present name="unit">

	<logic:notEmpty name="unit" property="authorizations">
			<bean:message key="authorizations.label.responsibles" bundle="EXPENDITURE_RESOURCES"/>:
				<fr:view name="unit" property="authorizations" schema="viewAuthorization">
					<fr:layout name="tabular">
						<fr:property name="classes" value="tstyle2"/>
					</fr:layout>
				</fr:view>	
	</logic:notEmpty>
	
	<logic:empty name="unit" property="authorizations">
		<p><em><bean:message key="authorizations.label.noResponsiblesDefinedForUnit" bundle="EXPENDITURE_RESOURCES"/></em></p>
	</logic:empty>
	
	<logic:present name="unit" property="parentUnit">
		<html:link action="/organization.do?method=viewOrganization" paramId="unitOid" paramName="unit" paramProperty="parentUnit.OID">
			<bean:write name="unit" property="parentUnit.name"/>
		</html:link>
		<logic:equal name="unit" property="parentUnit.class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.CostCenter">
			<logic:notEmpty name="unit" property="parentUnit.costCenter">
				(cc <bean:write name="unit" property="parentUnit.costCenter"/> )
			</logic:notEmpty>
		</logic:equal>
		<logic:equal name="unit" property="parentUnit.class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.Project">
			<logic:notEmpty name="unit" property="parentUnit.projectCode">
				(p <bean:write name="unit" property="parentUnit.projectCode"/> )
			</logic:notEmpty>
		</logic:equal>
		<logic:equal name="unit" property="parentUnit.class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.SubProject">
			<logic:notEmpty name="unit" property="parentUnit.projectCode">
				(sp)
			</logic:notEmpty>
		</logic:equal>
		<html:link action="/organization.do?method=editUnit" paramId="unitOid" paramName="unit" paramProperty="parentUnit.OID">
			<bean:message key="link.edit" bundle="EXPENDITURE_RESOURCES"/>
		</html:link>
		<html:link action="/organization.do?method=deleteUnit" paramId="unitOid" paramName="unit" paramProperty="parentUnit.OID">
			<bean:message key="link.delete" bundle="EXPENDITURE_RESOURCES"/>
		</html:link>
		<br/>	
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</logic:present>
	<html:link action="/organization.do?method=viewOrganization" paramId="unitOid" paramName="unit" paramProperty="OID">
		<bean:write name="unit" property="name"/>
	</html:link>
	<logic:equal name="unit" property="class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.CostCenter">
		<logic:notEmpty name="unit" property="costCenter">
			(cc <bean:write name="unit" property="costCenter"/> )
		</logic:notEmpty>
	</logic:equal>
	<logic:equal name="unit" property="class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.Project">
		<logic:notEmpty name="unit" property="projectCode">
			(p <bean:write name="unit" property="projectCode"/> )
		</logic:notEmpty>
	</logic:equal>
	<logic:equal name="unit" property="class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.SubProject">
		(sp)
	</logic:equal>
	<html:link action="/organization.do?method=editUnit" paramId="unitOid" paramName="unit" paramProperty="OID">
		<bean:message key="link.edit" bundle="EXPENDITURE_RESOURCES"/>
	</html:link>
	<html:link action="/organization.do?method=deleteUnit" paramId="unitOid" paramName="unit" paramProperty="OID">
		<bean:message key="link.delete" bundle="EXPENDITURE_RESOURCES"/>
	</html:link>
	<br/>	
</logic:present>
<logic:present name="units">
	<logic:iterate id="u" name="units">
		<logic:present name="unit">
			<logic:present name="unit" property="parentUnit">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</logic:present>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</logic:present>
		<html:link action="/organization.do?method=viewOrganization" paramId="unitOid" paramName="u" paramProperty="OID">
			<bean:write name="u" property="name"/>
		</html:link>
		<logic:equal name="u" property="class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.CostCenter">
			<logic:notEmpty name="u" property="costCenter">
				(cc <bean:write name="u" property="costCenter"/> )
			</logic:notEmpty>
		</logic:equal>
		<logic:equal name="u" property="class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.Project">
			<logic:notEmpty name="u" property="projectCode">
				(p <bean:write name="u" property="projectCode"/> )
			</logic:notEmpty>
		</logic:equal>
		<logic:equal name="u" property="class.name" value="pt.ist.expenditureTrackingSystem.domain.organization.SubProject">
			(sp)
		</logic:equal>
		<html:link action="/organization.do?method=editUnit" paramId="unitOid" paramName="u" paramProperty="OID">
			<bean:message key="link.edit" bundle="EXPENDITURE_RESOURCES"/>
		</html:link>
		<html:link action="/organization.do?method=deleteUnit" paramId="unitOid" paramName="u" paramProperty="OID">
			<bean:message key="link.delete" bundle="EXPENDITURE_RESOURCES"/>
		</html:link>
		<br/>
	</logic:iterate>
</logic:present>