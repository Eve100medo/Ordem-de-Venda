@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consume Usuário e ferramentas'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZEBG_C_USTO as projection on ZEBG_i_USTO
{
    key Userid,
    key Toolsid,
    Toolname,
    Knowledge,
    Interest,
    Training,
    Lastchangedat,
    /* Associations */
    _users: redirected to parent ZC_CDS_USER 
}
