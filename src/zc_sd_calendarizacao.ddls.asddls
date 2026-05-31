 //@AbapCatalog.sqlViewName:'ZSDCALEND'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Calendarização'

@OData.publish: true
@Metadata.allowExtensions: true
//@Search.searchable: true
@Analytics.query: true

define root view entity ZC_SD_CALENDARIZACAO
  as select from ZI_SD_CALENDARIZACAO
{
      @EndUserText.label: 'Numero_do_Documento'
  key salesdocument,
      @EndUserText.label: 'Item_do_Documento'
  key salesdocumentitem,
      @EndUserText.label: 'N_Div._Remessa_do_Documento'
  key scheduleline,
      @EndUserText.label: 'Data_da_Calendarização'
      @UI.selectionField: [{position: 20}]
      deliverydate,
      @EndUserText.label: 'Remessa'
      deliverydocument,
      @EndUserText.label: 'Data_da_Remessa'
      creationdate,
      @EndUserText.label: 'Codigo_de_Bloqueio'
      delivblockreasonforschedline,
       //@EndUserText.label: 'Quantidade_na_Remessa'
       //quantityinbaseunit,
      @EndUserText.label: 'Tipo de documento de vendas'
      @UI.selectionField: [{position: 10}]
      salesdocumenttype
       //@EndUserText.label: 'Saldo'
       //Saldo,
      // @EndUserText.label:'Quantidade Remanecente'
      // qtd_remanecente
}
