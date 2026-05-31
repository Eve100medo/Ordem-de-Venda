CLASS lhc_zc_calendarizacao DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    "   METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
    "  IMPORTING keys REQUEST requested_authorizations FOR zc_calendarizacao RESULT result.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zc_calendarizacao.

    METHODS read FOR READ
      IMPORTING keys FOR READ zc_calendarizacao RESULT result.

ENDCLASS.

CLASS lhc_zc_calendarizacao IMPLEMENTATION.

  METHOD delete.

    "" DATA: lt_app TYPE TABLE OF zebg_calend_sin,
    "         ls_app LIKE LINE OF lt_app.

    "  LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_app>).

    "   ls_app-salesdocument = <fs_app>-salesdocument.
    "  APPEND ls_app TO lt_app.

    "ENDLOOP.

    " DATA(lo_instance) = lhc_zc_calendarizacao=>get_instance( ).
    " lo_instance->set_delete_value ( lt_employee ).

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zc_calendarizacao DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zc_calendarizacao IMPLEMENTATION.

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
