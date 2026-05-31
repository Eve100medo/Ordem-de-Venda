@AbapCatalog.sqlViewName: 'ZEBGTOOLSVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Tools'
@Metadata.ignorePropagatedAnnotations: true
define view ZEBGCDS_TOOLS_VH as select from zebg_t_tools
{
    @UI.hidden: true // ocultar nosso campo UUID
    key toolsid as Toolsid,
    toolname as Toolname
    
}
