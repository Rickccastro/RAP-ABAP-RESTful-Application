CLASS zcl_certificates DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_certificates IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: tt_certf TYPE TABLE OF ztrap_certif WITH DEFAULT KEY.
    TYPES: tt_certfst TYPE TABLE OF ztrap_certif_st WITH DEFAULT KEY.

    DELETE FROM ztrap_certif.
    DELETE FROM ztrap_certif_st.

*    DATA(lt_certf) = VALUE tt_certf(
*        ( cert_uuid = '1' matnr = '1' )
*        ( cert_uuid = '2' matnr = '2' )
*        ( cert_uuid = '3' matnr = '3' )
*    ).
*    MODIFY ztrap_certif FROM TABLE @lt_certf.
*
*    DATA(lt_certfst) = VALUE tt_certfst(
*        ( state_uuid = '1' cert_uuid = '1' matnr = '1' )
*        ( state_uuid = '2' cert_uuid = '2' matnr = '2' )
*        ( state_uuid = '3' cert_uuid = '3' matnr = '3' )
*        ( state_uuid = '4' cert_uuid = '3' matnr = '3' )
*    ).
*    MODIFY ztrap_certif_st FROM TABLE @lt_certfst.

    out->write( 'Certificados Inseridos com sucesso!' ).



  ENDMETHOD.
ENDCLASS.
