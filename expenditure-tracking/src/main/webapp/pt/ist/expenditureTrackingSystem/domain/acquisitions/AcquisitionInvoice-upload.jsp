<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr" %>

<bean:define id="process" name="process" toScope="request"/>
<bean:define id="processOID" name="process" property="externalId" toScope="request" type="java.lang.String"/>

<bean:define id="selectedInstance" name="bean" property="selectedInstance.simpleName"/>

<bean:define id="schema" value='<%= "addFile-" + selectedInstance%>' toScope="request"/>

<bean:define id="urlView">/workflowProcessManagement.do?method=viewProcess&amp;processId=<bean:write name="process" property="externalId"/></bean:define>
<bean:define id="urlPostBack">/workflowProcessManagement.do?method=uploadPostBack&amp;processId=<bean:write name="process" property="externalId"/></bean:define>
<bean:define id="urlInvalid">/workflowProcessManagement.do?method=invalidFileUpload&amp;processId=<bean:write name="process" property="externalId"/></bean:define>

<div class="dinline forminline">
<fr:form action='<%= "/workflowProcessManagement.do?method=upload&processId=" + processOID %>' encoding="multipart/form-data">
<fr:edit name="bean" id="uploadFile" visible="false"/>

<fr:edit name="bean" id="form1"  schema="<%= schema %>">
	<fr:layout name="tabular">
		<fr:property name="classes" value="form forminline"/>
		<fr:property name="columnClasses" value=",,tderror"/>
	</fr:layout>
	<fr:destination name="cancel" path="<%= urlView %>" />
	<fr:destination name="postBack"  path="<%= urlPostBack %>"/>
	<fr:destination name="invalid" path="<%= urlInvalid %>"/>
</fr:edit>

<div id="form2">
	<fr:edit name="bean" property="items" id="items" layout="tabular-editable" schema="itemDescription.and.amount">
		<fr:layout>
			<fr:property name="classes" value="forminline"/>
		</fr:layout>
	</fr:edit>
</div>
		
		<html:submit styleClass="inputbutton">
			<bean:message key="renderers.form.submit.name" bundle="RENDERER_RESOURCES"/>
		</html:submit>
	</fr:form>


<fr:form action='<%= "/workflowProcessManagement.do?method=viewProcess&processId=" + processOID %>'>
	<html:submit styleClass="inputbutton">
		<bean:message key="renderers.form.cancel.name" bundle="RENDERER_RESOURCES"/>
	</html:submit>

</fr:form>
</div>

<script type="text/javascript">
var checkBox = $("input[id$='hasMoreInvoices']");
var itemList = $("#form2");

if (checkBox.attr('checked') == false) {
	itemList.hide();
}

checkBox.click(function(){	
	itemList.toggle();
	if (checkBox.attr('checked') == false) {
		$("input[name*=accountable]").each(function(){
			$(this).attr('checked','true');
		});
	}
});

</script>
