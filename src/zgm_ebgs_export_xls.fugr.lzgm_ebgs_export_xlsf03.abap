*----------------------------------------------------------------------*
***INCLUDE LZGM_EBGS_EXPORT_XLSF03.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form zf_busca_retorno
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM zf_busca_retorno CHANGING p_retorno .

  DATA:
        l_path TYPE string,
        l_len TYPE n.

  CLEAR:l_path, l_len.

  IF p_retorno IS INITIAL.
    IF sy-uname = 'GLO_DSILVA'.
      p_retorno = 'C:\Users\dsilva.globalhitss\Downloads'.
    ELSE.
      p_retorno = 'C:\Users\Downloads'.
    ENDIF.
  ENDIF.

ENDFORM.
