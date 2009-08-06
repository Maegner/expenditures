package pt.ist.expenditureTrackingSystem.domain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import myorg.applicationTier.Authenticate;
import myorg.util.Counter;
import myorg.util.MultiCounter;

import org.apache.commons.lang.StringUtils;

import pt.ist.emailNotifier.domain.Email;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.AcquisitionProcessStateType;
import pt.ist.expenditureTrackingSystem.domain.acquisitions.RefundProcessStateType;
import pt.ist.expenditureTrackingSystem.domain.organization.Person;
import pt.ist.expenditureTrackingSystem.presentationTier.actions.dashboard.DashBoardAction;
import pt.ist.expenditureTrackingSystem.util.ProcessMapGenerator;
import pt.ist.fenixWebFramework.services.Service;
import pt.utl.ist.fenix.tools.util.i18n.Language;

public class EmailDigester extends EmailDigester_Base {

    public EmailDigester() {
	super();
    }

    @Override
    @Service
    public void executeTask() {
	List<String> toAddress = new ArrayList<String>();
	Language.setLocale(Language.getDefaultLocale());
	for (Person person : ExpenditureTrackingSystem.getInstance().getPeople()) {
	    if (person.getOptions().getReceiveNotificationsByEmail()) {
		Authenticate.authenticate(person.getUsername(), StringUtils.EMPTY);
		Map<AcquisitionProcessStateType, MultiCounter<AcquisitionProcessStateType>> generateAcquisitionMap = ProcessMapGenerator
			.generateAcquisitionMap(person);
		Map<RefundProcessStateType, MultiCounter<RefundProcessStateType>> generateRefundMap = ProcessMapGenerator
			.generateRefundMap(person);

		if (!generateAcquisitionMap.isEmpty() || !generateRefundMap.isEmpty()) {
		    toAddress.clear();
		    final String email = person.getEmail();
		    if (email != null) {
			toAddress.add(email);
			new Email("Central de Compras", "noreply@ist.utl.pt", new String[] {}, toAddress, Collections.EMPTY_LIST,
				Collections.EMPTY_LIST, "Processos Pendentes", getBody(generateAcquisitionMap, generateRefundMap));
		    }
		}
	    }
	}
    }

    private String getBody(Map<AcquisitionProcessStateType, MultiCounter<AcquisitionProcessStateType>> acquisitionMap,
	    Map<RefundProcessStateType, MultiCounter<RefundProcessStateType>> refundMap) {

	StringBuilder builder = new StringBuilder("Caro utilizador, possui processos pendentes na central de compras.\n\n");
	if (!acquisitionMap.isEmpty()) {
	    builder.append("Regime simplificado\n");
	    for (MultiCounter<AcquisitionProcessStateType> multiCounter : acquisitionMap.values()) {
		builder.append("\t");
		builder.append(multiCounter.getCountableObject().getLocalizedName());
		builder.append("\t");
		builder.append(ProcessMapGenerator.getDefaultCounter(multiCounter).getValue());
		builder.append("\n");
	    }
	}
	if (!refundMap.isEmpty()) {
	    builder.append("Processos de reembolso\n");
	    for (MultiCounter<RefundProcessStateType> multiCounter : refundMap.values()) {
		builder.append("\t");
		builder.append(multiCounter.getCountableObject().getLocalizedName());
		builder.append("\t");
		builder.append(ProcessMapGenerator.getDefaultCounter(multiCounter).getValue());
		builder.append("\n");
	    }
	}
	builder.append("\n\n---\n");
	builder.append("Esta mensagem foi enviada por meio do sistema Central de Compras.\n");
	builder
		.append("Pode desactivar o envio destes e-mails fazendo login em http://compras.ist.utl.pt/, aceder à página de resumo seleccionando \"Aquisições\" e desactivando a opção \"Notificação por e-mail\"");
	return builder.toString();
    }

    @Override
    public String getLocalizedName() {
	return getClass().getName();
    }
}
