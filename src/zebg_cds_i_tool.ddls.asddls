@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface Ferramentas'
define root view entity ZEBG_CDS_I_TOOL as select from zebg_t_tools 
  association [0..*] to zebg_t_usertools on $projection.Toolsid = zebg_t_usertools.toolsid

{
  key toolsid       as Toolsid,
      toolname      as Toolname,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true //Definir a data do sistema
      lastchangedat as Lastchangedat
}
