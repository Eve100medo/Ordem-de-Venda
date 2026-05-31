@AbapCatalog.sqlViewName: 'ZEBGUSERSVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Users'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true // habilitar ajuda na pesquisa
define view ZEBGCDS_USERS_VH
  as select from zebg_t_user
{
  key userid        as Userid,
  @Search.defaultSearchElement: true // AJUDA NA PESQUISA
      email         as Email
     
}
