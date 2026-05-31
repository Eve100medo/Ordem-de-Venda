CLASS lcl_buffer DEFINITION.
  PUBLIC SECTION.

    TYPES: BEGIN OF ty_buffer.
             INCLUDE TYPE zc_sd_calendarizacao_c AS lv_data.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer.


    CLASS-DATA mt_buffer TYPE TABLE OF ty_buffer.


ENDCLASS.


CLASS lhc_zc_sd_calendarizacao_c DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zc_sd_calendarizacao_c RESULT result.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zc_sd_calendarizacao_c.

    METHODS read FOR READ
      IMPORTING keys FOR READ zc_sd_calendarizacao_c RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zc_sd_calendarizacao_c.

ENDCLASS.

CLASS lhc_zc_sd_calendarizacao_c IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD delete.

   DATA: lt_tabela        TYPE TABLE OF zebg_calend_sin,
        lr_salesdocument TYPE RANGE OF zc_sd_calendarizacao_c-salesdocument.

   LOOP AT keys INTO DATA(ls_delete).
    READ TABLE lcl_buffer=>mt_buffer
        ASSIGNING FIELD-SYMBOL(<ls_buffer>) WITH KEY salesdocument = ls_delete-salesdocument.

    IF sy-subrc = 0.

     IF <ls_buffer>-flag = 'C'.

     DELETE TABLE lcl_buffer=>mt_buffer FROM <ls_buffer>.
    ELSE.
     <ls_buffer>-flag = 'D'.
     ENDIF.
    ELSE.

      INSERT VALUE #( flag = 'D' salesdocument = ls_delete-salesdocument  ) INTO TABLE lcl_buffer=>mt_buffer.
    ENDIF.
     ENDLOOP.

   APPEND VALUE #( %tky = keys[ 1 ]-%tky ) TO failed-zc_sd_calendarizacao_c.

    APPEND VALUE #( %tky = keys[ 1 ]-%tky
                  %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                  text     = 'Não consigo sair desse erro' )
    )
     TO reported-zc_sd_calendarizacao_c.

    DATA : lt_msg     TYPE /dmo/t_message.
    LOOP AT keys ASSIGNING FIELD-SYMBOL(<lfs_booking>).

      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_UPDATE'
        EXPORTING
          is_travel   = VALUE /dmo/s_travel_in(  travel_id = <lfs_booking>-salesdocument )
          is_travelx  = VALUE /dmo/s_travel_inx( travel_id = <lfs_booking>-salesdocumentitem )
          it_bookingx = VALUE /dmo/t_booking_inx( ( booking_id  = <lfs_booking>-salesdocument
                                                    action_code = /dmo/if_flight_legacy=>action_code-delete ) )
        IMPORTING
          et_messages = lt_msg.
      IF lt_msg IS NOT INITIAL.
        LOOP AT lt_msg INTO DATA(ls_msg) WHERE msgty CA 'EA'.
          APPEND VALUE #( %cid          = <lfs_booking>-%cid_ref
                          salesdocument = <lfs_booking>-salesdocument
                        ) TO failed-zc_sd_calendarizacao_c.

          APPEND VALUE #( %msg               = new_message( id       = ls_msg-msgid
                                                            number   = ls_msg-msgno
                                                            v1       = ls_msg-msgv1
                                                            v2       = ls_msg-msgv2
                                                            v3       = ls_msg-msgv3
                                                            v4       = ls_msg-msgv4
                                                            severity = if_abap_behv_message=>severity-error )
                          %key-salesdocument = <lfs_booking>-salesdocument
                          %cid               = <lfs_booking>-%cid_ref
                          %delete            = 'X'
                        ) TO reported-zc_sd_calendarizacao_c.
        ENDLOOP.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zc_sd_calendarizacao_c DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zc_sd_calendarizacao_c IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    DATA lt_data TYPE STANDARD TABLE OF zc_sd_calendarizacao_c.

    " find all rows in buffer with flag = deleted
    lt_data = VALUE #(  FOR row IN lcl_buffer=>mt_buffer WHERE  ( flag = 'D' ) (  row-lv_data ) ).
    IF lt_data IS NOT INITIAL.
      DELETE zebg_calend_sin FROM TABLE @lt_data.
    ENDIF.

    CLEAR lcl_buffer=>mt_buffer.

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
