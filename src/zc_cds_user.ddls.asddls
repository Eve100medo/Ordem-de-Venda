@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'User cds 2'
@Metadata.allowExtensions: true
define root view entity ZC_CDS_USER as projection on ZI_CDS_USERS
{
    key UserId,
    Email,
    Fullname,
    Isnew,
    Lastchangedat,
    
    _usertools: redirected to composition child ZEBG_C_USTO
}
