FUNCTION zebg_convert_euro.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     REFERENCE(I_VALOR) TYPE  ZEBG_CONVERT_API-EURO
*"     REFERENCE(I_TAXA) TYPE  ZEBG_CONVERT_API-EURO
*"  EXPORTING
*"     REFERENCE(O_REAL) TYPE  ZEBG_CONVERT_API-EURO
*"----------------------------------------------------------------------


  DATA: lv_result TYPE zebg_convert_api-euro.
 clear: lv_result.

  lv_result = i_valor * i_taxa.

  o_real = lv_result.


ENDFUNCTION.
