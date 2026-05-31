@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consume Usuários'
@Metadata.allowExtensions: true
define root view entity ZEBG_C_USERS as projection on ZEBG_I_USERS
{
    key Userid,
    Email,
    Fullname,
    Isnew,
    Lastchangedat,
    /* Associations */
    _user_tools: redirected to composition child ZEBG_C_USERTOOLS 
}
