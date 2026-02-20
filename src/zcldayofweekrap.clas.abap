CLASS zcldayofweekrap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcldayofweekrap IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA lt_original_data TYPE TABLE OF ZI_FLIGHT_DETAIL WITH DEFAULT KEY.

    lt_original_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs>).
        <fs>-DayOfWeek = 'Segunda-Feira'.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    LOOP AT it_requested_calc_elements ASSIGNING FIELD-SYMBOL(<fs>).
            IF <fs> EQ 'DayOfWeek'.
                APPEND 'FlightDate' TO et_requested_orig_elements.
            ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
