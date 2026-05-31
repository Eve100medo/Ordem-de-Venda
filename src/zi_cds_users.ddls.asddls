@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds users'
define root view entity ZI_CDS_USERS
  as select from zebg_t_user
  composition [0..*] of ZEBG_i_USTO as _usertools

{

  key userid        as UserId,
      email         as Email,
      fullname      as Fullname,
      isnew         as Isnew,
      lastchangedat as Lastchangedat,

      _usertools // Make association public
}
