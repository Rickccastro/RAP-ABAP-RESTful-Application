CLASS zcl_customentity DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_customentity IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
  "Page Size- Tamanho pagina
  "Off Set - Paginação
  "Filtros
  "Seleção de dados

  DATA(lv_top) = io_request->get_paging( )->get_page_size( ).
  DATA(lv_skip) = io_request->get_paging( )->get_offset( ).
  DATA(lt_cause) = io_request->get_filter( )->get_as_sql_string( ).

  DATA: lt_flights TYPE TABLE OF /dmo/flight,
        ls_flight TYPE /dmo/flight.

  DATA: lt_result TYPE STANDARD TABLE OF ZI_FLIGHT_RAP_CUSTOM_ENTITY,
        ls_result TYPE ZI_FLIGHT_RAP_CUSTOM_ENTITY.

        TRY.
            DATA(lt_field_cond) = io_request->get_filter( )->get_as_ranges( ).
            CATCH cx_rap_query_filter_no_range INTO DATA(lx_no_sel_option).
        ENDTRY.


        SELECT * FROM /dmo/flight INTO TABLE @lt_flights.

        IF lv_top > 0.
           LOOP AT lt_flights INTO ls_flight FROM lv_skip + 1 TO ( lv_skip + lv_top ).
            MOVE-CORRESPONDING ls_flight to ls_result.
            APPEND ls_result TO lt_result.
           ENDLOOP.
        ENDIF.

        IF io_request->is_total_numb_of_rec_requested( ).
            io_response->set_total_number_of_records( lines( lt_flights ) ).
        ENDIF.

        io_response->set_data( lt_result ).


  ENDMETHOD.

ENDCLASS.
