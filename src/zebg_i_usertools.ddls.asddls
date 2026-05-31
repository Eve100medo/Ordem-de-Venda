@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Usuário Ferramentas'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZEBG_I_USERTOOLS
  as select from zebg_t_usertools
  association to parent ZEBG_I_USERS as _user on $projection.Userid = _user.Userid
{
  key userid        as Userid,
  key toolsid       as Toolsid,
        
      toolname      as Toolname,
      knowledge     as Knowledge,
      interest      as Interest,
      training      as Training,
      lastchangedat as Lastchangedat,

      _user // Make association public
}
