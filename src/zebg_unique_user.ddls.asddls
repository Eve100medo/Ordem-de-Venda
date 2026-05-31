@AbapCatalog.sqlViewName: 'ZEBGVVHUUSER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Unique User'
define view ZEBG_UNIQUE_USER as select from zebg_t_user
{
     key userid as Userid,
          @Search.defaultSearchElement: true
          email as Email
}
where userid = $session.user
