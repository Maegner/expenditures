<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr"%>

<div class="infobox">

	<table class="tstyle1" style="width: 100%;">
		<tr>
			<th style="width: 185px;"><bean:message key="label.mission.item.type" bundle="MISSION_RESOURCES"/>:</th>
			<td><fr:view name="missionItem" property="localizedName"/></td>
		</tr>
		<tr>
			<th>
				<bean:message key="label.mission.item.transportation.itinerary" bundle="MISSION_RESOURCES"/>:
			</th>
			<td>
				<fr:view name="missionItem" property="itinerary"/>
			</td>
		</tr>
		<tr>
			<th>
				<bean:message key="label.mission.item.value" bundle="MISSION_RESOURCES"/>:
			</th>
			<td>
				<fr:view name="missionItem" property="value"/>
			</td>
		</tr>
		<tr>
			<th><bean:message key="label.mission.item.participants" bundle="MISSION_RESOURCES"/>:</th>
			<td>
				<fr:view name="missionItem" property="people">
					<fr:layout name="separator-list">
						<fr:property name="eachLayout" value="values"/>
						<fr:property name="eachSchema" value="person-name"/>
						<fr:property name="separator" value=","/>
					</fr:layout>
				</fr:view>
			</td>
		</tr>
		<tr>
			<th><bean:message key="label.mission.item.financers" bundle="MISSION_RESOURCES"/>:</th>
			<td>
				<fr:view name="missionItem" property="missionItemFinancers">
					<fr:schema type="module.mission.domain.MissionItemFinancer" bundle="MISSION_RESOURCES">
						<fr:slot name="missionFinancer.unit.presentationName" key="label.mission.financer" />
						<fr:slot name="missionFinancer.accountingUnit.name" key="label.mission.financer.accounting.unit" />
						<fr:slot name="amount" key="label.mission.financer.amount" />
						<fr:slot name="allFundAllocationId" key="label.mission.financer.fundAllocationId" />
					</fr:schema>
					<fr:layout>
						<fr:property name="classes" value="nobullet"/>
						<fr:property name="eachSchema" value="module.mission.domain.MissionItemFinancer"/>
					    <fr:property name="eachLayout" value="nonNullValues-commaSeparated"/>
					</fr:layout>
				</fr:view>
			</td>
		</tr>
	</table>
</div>
