//@AbapCatalog.sqlViewName: 'ZCALEND'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds consumo Calendarização'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_CALENDARIZACAO
  as select from ZI_SD_CALENDARIZACAO
{

      @EndUserText.label: 'Numero do Documento'     
  key salesdocument,
      @EndUserText.label: 'Item do Documento'
  key salesdocumentitem,
      @EndUserText.label: 'N° Div.Remessa do Documento'
  key scheduleline,
      @EndUserText.label: 'Data da Calendarização'
      deliverydate,
      @EndUserText.label: 'Remessa'
      deliverydocument,
      @EndUserText.label: 'Codigo de Bloqueio'
      creationdate,
      @EndUserText.label: 'Quantidade na Remessa'
      delivblockreasonforschedline
      //@EndUserText.label: 'Quantidade em unidade de base'
      //quantityinbaseunit,
      //@EndUserText.label: 'Tipo de documento de vendas'
      //salesdocumenttype,
      //Saldo,
      //@EndUserText.label:'Quantidade Remanecente'
      //qtd_remanecente
}
