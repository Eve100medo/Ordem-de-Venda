@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface de Usuário'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true // habilitar ajuda na pesquisa
define root view entity ZEBG_I_USERS
  as select from zebg_t_user
  composition [0..*] of ZEBG_I_USERTOOLS as _user_tools
{
   @Search.defaultSearchElement: true // AJUDA NA PESQUISA  
  key userid        as Userid,
    @Search.defaultSearchElement: true // AJUDA NA PESQUISA
      email         as Email,
       @Search.defaultSearchElement: true // AJUDA NA PESQUISA
      fullname      as Fullname,
      isnew         as Isnew,
      lastchangedat as Lastchangedat,
      _user_tools // Make association public
}
