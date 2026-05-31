CLASS zebg_call_bapi_material_vu DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: lv_matnr TYPE c LENGTH 18,
           ls_bapimatdoa TYPE bapimatdoa.

         METHODS: get_info_material IMPORTING matnr TYPE matnr18
                                  EXPORTING generaldata TYPE bapimatdoa.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zebg_call_bapi_material_vu IMPLEMENTATION.

    METHOD get_info_material.
        DATA: ls_plantdata     TYPE bapimatdoc,
              ls_valuationdata TYPE bapimatdobew,
              ls_return        TYPE bapiret2.

    CALL FUNCTION 'BAPI_MATERIAL_GET_DETAIL'
      EXPORTING
        material = matnr
      IMPORTING
        materialplantdata     = ls_plantdata
        materialvaluationdata = ls_valuationdata
        material_general_data = generaldata
        return                = ls_return.
    ENDMETHOD.



ENDCLASS.
