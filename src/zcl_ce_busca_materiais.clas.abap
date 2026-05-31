CLASS zcl_ce_busca_materiais DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_rap_query_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ce_busca_materiais IMPLEMENTATION.


METHOD if_rap_query_provider~select.

    DATA: lr_product TYPE RANGE OF I_Product-Product,
          lr_createdate TYPE RANGE OF I_Product-CreationDate.
    DATA(lv_skip) = io_request->get_paging( )->get_offset( ).
    DATA(lv_top) = io_request->get_paging( )->get_page_size(  ).
    DATA(lv_query) = io_request->get_filter( )->get_as_ranges( ).

    TRY.
      lr_product = VALUE #( FOR ls_query IN lv_query[ name = 'PRODUCT' ]-range ( sign = 'I' option = 'EQ' low = ls_query-low ) ).

    CATCH cx_sy_itab_line_not_found.
      " Tratar exceção se a linha com 'PRODUCT' não for encontrada
    ENDTRY.

    TRY.
        lr_createdate = VALUE #( FOR ls_query IN lv_query[ name = 'CREATIONDATE' ]-range ( sign = 'I'
                                                                                           option = 'BT'
                                                                                           low = ls_query-low
                                                                                           high = ls_query-high ) ).
        CATCH cx_sy_itab_line_not_found.
     ENDTRY.


    SELECT FROM i_product AS prd
    INNER JOIN I_ProductText AS prdt ON prd~Product = prdt~Product
    FIELDS prd~Product,
         prd~CreationDate,
         prd~CreatedByUser,
         prd~CreationTime,
         prd~LastChangeDate,
         prd~ProductType,
         prdt~ProductName
  WHERE prd~Product IN @lr_product
  ORDER BY prd~Product
  INTO TABLE @DATA(lt_material)
    UP TO @lv_top ROWS
    OFFSET @lv_skip.

     io_response->set_total_number_of_records( lines( lt_material ) ).
    io_response->set_data( lt_material ).
ENDMETHOD.

ENDCLASS.
