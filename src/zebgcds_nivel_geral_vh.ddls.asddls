@AbapCatalog.sqlViewName: 'ZEBGVHNG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Nivel Geral'
@Metadata.ignorePropagatedAnnotations: true

define view ZEBGCDS_NIVEL_GERAL_VH
  as select from dd07t
{
      @UI.hidden:true
  key domname    as Domname,
  @UI.hidden:true
  key ddlanguage as ddlanguage,
  @UI.hidden:true
  key as4local   as as4local,
  @UI.hidden:true
  key valpos     as valpos,
  @UI.hidden:true
  key as4vers    as as4vers,
      ddtext     as Ddtext,
      @UI.hidden:true
      domval_ld  as domval_ld,
      @UI.hidden:true
      domval_hd  as domval_hd,
      domvalue_l as DomvalueL
}
where
      as4local   = 'A'
  and ddlanguage = $session.system_language
  and domname    = 'ZD_NIVEL_GERAL'
