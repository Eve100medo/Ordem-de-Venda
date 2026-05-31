@AbapCatalog.sqlViewName: 'ZEBGVHTOOLS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Nivel Geral'
@Search.searchable: true
define view ZEBGCDS_FERRAMENTAS_VH as select from zebg_t_tools
{
    @UI.hidden:true
key toolsid  as Toolsid,
        @Search.defaultSearchElement: true
        toolname as Toolname 
}
