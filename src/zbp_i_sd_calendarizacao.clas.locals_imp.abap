CLASS lhc_zi_sd_calendarizacao DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_sd_calendarizacao RESULT result.


    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_sd_calendarizacao.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_sd_calendarizacao RESULT result.

ENDCLASS.

CLASS lhc_zi_sd_calendarizacao IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_sd_calendarizacao DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zi_sd_calendarizacao IMPLEMENTATION.

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
