<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<h2><bean:message key="acquisitionProcess.title.editAcquisitionRequest" bundle="ACQUISITION_RESOURCES"/></h2>

<bean:define id="acquisitionProcessOID " name="acquisitionProcess" property="OID" />


<fr:edit id="acquisitionRequestBean" name="acquisitionRequestBean"
		schema="editAcquisitionRequest"
		action="<%= "/acquisitionProcess.do?method=editAcquisitionRequest&amp;acquisitionProcessOid=" + acquisitionProcessOID  %>">
		<fr:layout name="tabular">
			<fr:property name="classes" value="form"/>
		</fr:layout>
		<fr:destination name="cancel" path="<%= "/acquisitionProcess.do?method=viewAcquisitionProcess&amp;acquisitionProcessOid=" + acquisitionProcessOID %>" />
</fr:edit>
