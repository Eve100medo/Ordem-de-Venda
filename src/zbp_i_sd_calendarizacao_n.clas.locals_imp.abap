CLASS lhc_zi_sd_calendarizacao_n DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_sd_calendarizacao_n.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_sd_calendarizacao_n.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_sd_calendarizacao_n RESULT result.

ENDCLASS.

CLASS lhc_zi_sd_calendarizacao_n IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
    DATA: lt_to_delete TYPE  isdslsdocschedln .
    DATA: ls_db_data type isdslsdocschedln .
    DATA: ls_failed_local LIKE LINE OF failed-zi_sd_calendarizacao_n. "Corrigido: Acesso correto à estrutura failed
    DATA: ls_reported_local LIKE LINE OF reported-zi_sd_calendarizacao_n. "Corrigido: Acesso correto à estrutura reported



    "Loop pelas chaves dos registros a serem excluídos
    LOOP AT keys INTO DATA(ls_key).
      " Leia os dados da tabela subjacente para o registro atual


      " *** INÍCIO DA LÓGICA DE NEGÓCIOS PARA EXCLUSÃO ***

      "APPEND ls_db_data TO lt_to_delete.
      IF lt_to_delete-delivblockreasonforschedline IS NOT INITIAL.
        ls_failed_local-%key = ls_key-%key.
        "ls_failed = CORRESPONDING #( ls_failed | ls_failed_local ).

        ls_reported_local-%key = ls_key-%key.

        CONTINUE.
      ENDIF.



      "APPEND ls_db_data TO lt_to_delete.

      " *** FIM DA LÓGICA DE NEGÓCIOS PARA EXCLUSÃO ***

    ENDLOOP.


    IF lt_to_delete IS NOT INITIAL.

//""      LOOP AT lt_to_delete ASSIGNING FIELD-SYMBOL(<fs_to_delete>).


        IF sy-subrc <> 0.
          "Erro ao excluir da tabela
          LOOP AT keys INTO ls_key.
            ls_failed_local-%key = ls_key-%key.
            "ls_failed = CORRESPONDING #( ls_failed | ls_failed_local ).

            ls_reported_local-%key = ls_key-%key.
            "ls_reported_local-%msg = NEW zcl_meu_handler_mensagens( severity = if_abap_behv_message=>severity-error
            "textid   = 'ERRO_AO_EXCLUIR_DB' ).
            "APPEND ls_reported_local TO reported. " Corrigido: Adicionar à tabela 'reported'
          ENDLOOP.
        ENDIF.

//""      ENDLOOP.

    ENDIF.

  ENDIF.



ENDMETHOD.

METHOD read.
ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_sd_calendarizacao_n DEFINITION INHERITING FROM cl_abap_behavior_saver.
PROTECTED SECTION.

  METHODS finalize REDEFINITION.

  METHODS check_before_save REDEFINITION.

  METHODS save REDEFINITION.

  METHODS cleanup REDEFINITION.

  METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zi_sd_calendarizacao_n IMPLEMENTATION.

METHOD finalize.
ENDMETHOD.

METHOD check_before_save.
ENDMETHOD.

METHOD save.
ENDMETHOD.

METHOD cleanup.
ENDMETHOD.

METHOD cleanup_finalize.
ENDMETHOD.

ENDCLASS.
