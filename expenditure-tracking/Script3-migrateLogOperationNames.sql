-- Operation now contains the full classname instead of only the name

update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.AddAcquisitionProposalDocument' WHERE OPERATION='AddAcquisitionProposalDocument';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.CreateAcquisitionRequestItem' WHERE OPERATION='CreateAcquisitionRequestItem';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.EditAcquisitionRequestItem' WHERE OPERATION='EditAcquisitionRequestItem';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.SubmitForFundAllocation' WHERE OPERATION='SubmitForFundAllocation';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.FundAllocationExpirationDate' WHERE OPERATION='FundAllocationExpirationDate';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.ProjectFundAllocation' WHERE OPERATION='ProjectFundAllocation';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.FundAllocation' WHERE OPERATION='FundAllocation';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.GenericAddPayingUnit' WHERE OPERATION='GenericAddPayingUnit';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.GenericAssignPayingUnitToItem' WHERE OPERATION='GenericAssignPayingUnitToItem';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.Authorize' WHERE OPERATION='Authorize';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RemoveFundAllocationExpirationDate' WHERE OPERATION='RemoveFundAllocationExpirationDate';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.GenericRemovePayingUnit' WHERE OPERATION='GenericRemovePayingUnit';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.SendPurchaseOrderToSupplier' WHERE OPERATION='SendPurchaseOrderToSupplier';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.ReceiveInvoice' WHERE OPERATION='ReceiveInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.SubmitForConfirmInvoice' WHERE OPERATION='SubmitForConfirmInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.CancelAcquisitionRequest' WHERE OPERATION='CancelAcquisitionRequest';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.ConfirmInvoice' WHERE OPERATION='ConfirmInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.DeleteAcquisitionRequestItem' WHERE OPERATION='DeleteAcquisitionRequestItem';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.SetRefundee' WHERE OPERATION='SetRefundee';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.ChangeAcquisitionProposalDocument' WHERE OPERATION='ChangeAcquisitionProposalDocument';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.UnsetRefundee' WHERE OPERATION='UnsetRefundee';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RejectAcquisitionProcess' WHERE OPERATION='RejectAcquisitionProcess';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.ChangeRefundee' WHERE OPERATION='ChangeRefundee';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.CreateAcquisitionPurchaseOrderDocument' WHERE OPERATION='CreateAcquisitionPurchaseOrderDocument';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.SkipPurchaseOrderDocument' WHERE OPERATION='SkipPurchaseOrderDocument';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.afterthefact.AfterTheFactAcquisitionProcess.Create' WHERE OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.afterthefact.AfterTheFactAcquisitionProcess.Create';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.afterthefact.activities.EditAfterTheFactAcquisition' WHERE OPERATION='EditAfterTheFactAcquisition';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.UnApprove' WHERE OPERATION='UnApprove';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.AllocateFundsPermanently' WHERE OPERATION='AllocateFundsPermanently';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.EditAcquisitionRequestItemRealValues' WHERE OPERATION='EditAcquisitionRequestItemRealValues';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.FixInvoice' WHERE OPERATION='FixInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.afterthefact.activities.ReceiveAcquisitionInvoice' WHERE OPERATION='ReceiveAcquisitionInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.AllocateProjectFundsPermanently' WHERE OPERATION='AllocateProjectFundsPermanently';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RevertInvoiceSubmission' WHERE OPERATION='RevertInvoiceSubmission';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.afterthefact.activities.DeleteAfterTheFactAcquisitionProcess' WHERE OPERATION='DeleteAfterTheFactAcquisitionProcess';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RemoveFundAllocationExpirationDateForResponsible' WHERE OPERATION='RemoveFundAllocationExpirationDateForResponsible';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.UnAuthorize' WHERE OPERATION='UnAuthorize';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.RemoveFundsPermanentlyAllocated' WHERE OPERATION='RemoveFundsPermanentlyAllocated';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RevertSkipPurchaseOrderDocument' WHERE OPERATION='RevertSkipPurchaseOrderDocument';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.CancelInvoiceConfirmation' WHERE OPERATION='CancelInvoiceConfirmation';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RevertProcessNotConfirmmingFundAllocationExpirationDate' WHERE OPERATION='RevertProcessNotConfirmmingFundAllocationExpirationDate';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RemoveCancelProcess' WHERE OPERATION='RemoveCancelProcess';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RevertToInvoiceConfirmation' WHERE OPERATION='RevertToInvoiceConfirmation';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.activities.RemovePermanentProjectFunds' WHERE OPERATION='RemovePermanentProjectFunds';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.PayAcquisition' WHERE OPERATION='PayAcquisition';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.CreateRefundItem' WHERE OPERATION='CreateRefundItem';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.Approve' WHERE OPERATION='Approve';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.CancelRefundProcess' WHERE OPERATION='CancelRefundProcess';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.EditRefundItem' WHERE OPERATION='EditRefundItem';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.DeleteRefundItem' WHERE OPERATION='DeleteRefundItem';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RemoveInvoice' WHERE OPERATION='RemoveInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.UnSubmitForFundAllocation' WHERE OPERATION='UnSubmitForFundAllocation';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.CreateRefundInvoice' WHERE OPERATION='CreateRefundInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.SubmitForInvoiceConfirmation' WHERE OPERATION='SubmitForInvoiceConfirmation';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.RemoveRefundInvoice' WHERE OPERATION='RemoveRefundInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.EditRefundInvoice' WHERE OPERATION='EditRefundInvoice';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.ConfirmInvoices' WHERE OPERATION='ConfirmInvoices';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.RefundPerson' WHERE OPERATION='RefundPerson';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.UnconfirmInvoices' WHERE OPERATION='UnconfirmInvoices';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.ChangeProcessClassification' WHERE OPERATION='ChangeProcessClassification';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.UnlockInvoiceReceiving' WHERE OPERATION='UnlockInvoiceReceiving';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.LockInvoiceReceiving' WHERE OPERATION='LockInvoiceReceiving';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.RevertInvoiceConfirmationSubmition' WHERE OPERATION='RevertInvoiceConfirmationSubmition';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.announcements.activities.SubmitAnnouncementForApproval' WHERE OPERATION='SubmitAnnouncementForApproval';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.announcements.activities.ApproveAnnouncementProcess' WHERE OPERATION='ApproveAnnouncementProcess';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.announcements.activities.EditAnnouncementForApproval' WHERE OPERATION='EditAnnouncementForApproval';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.announcements.activities.RejectAnnouncementProcess' WHERE OPERATION='RejectAnnouncementProcess';
update WORKFLOW_LOG SET OPERATION='pt.ist.expenditureTrackingSystem.domain.announcements.activities.CloseAnnouncementProcess' WHERE OPERATION='CloseAnnouncementProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.SubmitForApproval' WHERE WL.OPERATION='SubmitForApproval' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.SubmitForApproval' WHERE WL.OPERATION='SubmitForApproval' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.UnSubmitForApproval' WHERE WL.OPERATION='UnSubmitForApproval' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.UnSubmitForApproval' WHERE WL.OPERATION='UnSubmitForApproval' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RemoveFundAllocation' WHERE WL.OPERATION='RemoveFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.RemoveFundAllocation' WHERE WL.OPERATION='RemoveFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.ChangeFinancersAccountingUnit' WHERE WL.OPERATION='ChangeFinancersAccountingUnit' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.ChangeFinancersAccountingUnit' WHERE WL.OPERATION='ChangeFinancersAccountingUnit' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.SetSkipSupplierFundAllocation' WHERE WL.OPERATION='SetSkipSupplierFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.SetSkipSupplierFundAllocation' WHERE WL.OPERATION='SetSkipSupplierFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.UnsetSkipSupplierFundAllocation' WHERE WL.OPERATION='UnsetSkipSupplierFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.UnsetSkipSupplierFundAllocation' WHERE WL.OPERATION='UnsetSkipSupplierFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.RemoveProjectFundAllocation' WHERE WL.OPERATION='RemoveProjectFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.RemoveProjectFundAllocation' WHERE WL.OPERATION='RemoveProjectFundAllocation' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.activities.DistributeRealValuesForPayingUnits' WHERE WL.OPERATION='DistributeRealValuesForPayingUnits' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.simplified.SimplifiedProcedureProcess';
update WORKFLOW_LOG WL, WORKFLOW_PROCESS P SET WL.OPERATION='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.activities.DistributeRealValuesForPayingUnits' WHERE WL.OPERATION='DistributeRealValuesForPayingUnits' AND WL.OID_PROCESS=P.OID AND P.OJB_CONCRETE_CLASS='pt.ist.expenditureTrackingSystem.domain.acquisitions.refund.RefundProcess';