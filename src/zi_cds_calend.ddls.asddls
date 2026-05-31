@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds basica'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CDS_CALEND as select from zebg_calend_sin

{
    key salesdocument as Salesdocument,
    key salesdocumentitem as Salesdocumentitem,
    scheduleline as Scheduleline,
    deliverydate as Deliverydate,
    deliverydocument as Deliverydocument,
    creationdate as Creationdate,
    delivblockreasonforschedline as Delivblockreasonforschedline,
    quantityinbaseunit as Quantityinbaseunit,
    saldo as Saldo,
    qtd_remanecente as QtdRemanecente
    
}
