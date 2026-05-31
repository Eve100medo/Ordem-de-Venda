@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consume Usuários  Ferramentas'
@Metadata.allowExtensions: true
define  view entity ZEBG_C_USERTOOLS 
    as projection on ZEBG_I_USERTOOLS
{
    key Userid,
    key Toolsid,
    Toolname,
    Knowledge,
    Interest,
    Training,
    Lastchangedat,
    /* Associations */
    _user: redirected to parent ZEBG_C_USERS
}
