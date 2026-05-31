@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_CALEND'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CALEND
  provider contract transactional_query as projection on ZI_CDS_CALEND
{
    key Salesdocument,
    key Salesdocumentitem,
    Scheduleline,
    Deliverydate,
    Deliverydocument,
    Creationdate,
    Delivblockreasonforschedline,
    Quantityinbaseunit,
    Saldo,
    QtdRemanecente
}
