CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS call FOR MODIFY
      IMPORTING keys FOR ACTION travel~call RESULT result.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD call.
*   DATA: lt_bp            TYPE STANDARD TABLE OF,
       DATA:   lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_read_request  TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_read_response TYPE REF TO /iwbep/if_cp_response_read_lst.
    DATA lv_relative_service_root TYPE string.

    TRY.


        cl_http_client=>create_internal(
          IMPORTING
            client = DATA(lo_http_client)
        ).
        IF sy-subrc <> 0.
*          out->write( 'error create by http destination' ).
          EXIT.
        ENDIF.
        lv_relative_service_root = '/sap/opu/odata/sap/API_BUSINESS_PARTNER/'.
        "oData v4 remote proxy
        lo_client_proxy = /iwbep/cl_cp_client_proxy_fact=>create_v2_remote_proxy(
           io_http_client = lo_http_client
           is_proxy_model_key = VALUE #( repository_id       = /iwbep/if_cp_registry_types=>gcs_repository_id-default
                                         proxy_model_id      = to_upper( 'ZSCM_BUSINESSPARTNER' )
                                         proxy_model_version = 0001 )
           iv_relative_service_root = lv_relative_service_root ).

        lo_read_request = lo_client_proxy->create_resource_for_entity_set( 'A_ADDRESS_EMAIL_ADDRESS' )->create_request_for_read( ).
        lo_read_request->set_top( iv_top = 10 ).
        lo_read_response = lo_read_request->execute( ).

        "Retrieve the business data
*        lo_read_response->get_business_data( IMPORTING et_business_data = DATA(lt_bp) ).
*
*        LOOP AT lt_bp INTO DATA(ls_bp).
*          out->write( ls_bp ).
*        ENDLOOP.
      CATCH /iwbep/cx_cp_remote INTO DATA(lx_cp_remote).
        " Error handling
*        out->write( lx_cp_remote->get_longtext( ) ).
      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Error Handling
*        out->write( lx_gateway->get_longtext( ) ).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
