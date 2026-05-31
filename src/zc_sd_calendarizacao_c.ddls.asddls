@AbapCatalog.sqlViewName: 'ZCALEND'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS de Consumo - correta'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view ZC_SD_CALENDARIZACAO_C
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
      delivblockreasonforschedline,
      @EndUserText.label: 'Quantidade em unidade de base'
      quantityinbaseunit,
      @EndUserText.label: 'Tipo de documento de vendas'
      salesdocumenttype,
      Saldo,
      @EndUserText.label:'Quantidade Remanecente'
      qtd_remanecente
}
