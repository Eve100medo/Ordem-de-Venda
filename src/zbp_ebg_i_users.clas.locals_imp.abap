CLASS lhc__users DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _users RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _users RESULT result.

    METHODS setinactive FOR MODIFY
      IMPORTING keys FOR ACTION _users~setinactive RESULT result.

ENDCLASS.

CLASS lhc__users IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD setInactive.
     MODIFY ENTITIES OF ZEBG_I_USERS IN LOCAL MODE
                               ENTITY _users
                               UPDATE FIELDS ( isNew )
                               WITH VALUE #( FOR key IN keys
                                      ( %tky = key-%tky
                                      isNew = abap_true ) )
                FAILED failed
                REPORTED reported.

                READ ENTITIES OF ZEBG_I_USERS IN LOCAL MODE
                ENTITY _users
                ALL FIELDS WITH CORRESPONDING #( keys )
                RESULT DATA(results).

                result = VALUE #( FOR line IN results
                               ( %tky = line-%tky
                                 %param = line ) ).
  ENDMETHOD.

ENDCLASS.
