@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds consumo Calendarização new'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true



define root view entity ZC_CALENDARIZACAO_N as select from ZI_SD_CALENDARIZACAO_N
{
    key salesdocument,
    key salesdocumentitem,
    key scheduleline,
    deliverydate,
    deliverydocument,
    creationdate,
    delivblockreasonforschedline,
    //quantityinbaseunit,
    salesdocumenttype
    //Saldo,
    //qtd_remanecente
}
