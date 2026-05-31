@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface Usuario Ferramentas'
@Metadata.allowExtensions: true
define view entity ZEBG_i_USTO
  as select from zebg_t_usertools
  association to parent ZI_CDS_USERS as _users on $projection.Userid= _users.UserId
{
  key userid        as Userid,
  key toolsid       as Toolsid,
      toolname      as Toolname,
      knowledge     as Knowledge,
      interest      as Interest,
      training      as Training,
      lastchangedat as Lastchangedat,
     _users // Make association public
}
