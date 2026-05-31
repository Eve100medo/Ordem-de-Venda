@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consume Ferramentas'
@Metadata.allowExtensions: true

define root view entity ZEBGCDS_C_TOOLS as projection on ZEBG_CDS_I_TOOL
{
    key Toolsid,
    Toolname,
    Lastchangedat
}
