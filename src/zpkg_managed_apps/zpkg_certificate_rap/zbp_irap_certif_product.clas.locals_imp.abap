CLASS lhc_Certificate DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Certificate RESULT result.
    METHODS setinitialvalues FOR DETERMINE ON MODIFY
      IMPORTING keys FOR certificate~setinitialvalues.

ENDCLASS.

CLASS lhc_Certificate IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setInitialValues.

    READ ENTITIES OF zirap_certif_product IN LOCAL MODE
         ENTITY Certificate
         FIELDS ( CertStatus )
         WITH CORRESPONDING #( keys )
         RESULT DATA(lt_certificates).

    " Seta o Status e Version na tela de criação do Certificado.
    IF lt_certificates IS NOT INITIAL.
      MODIFY ENTITIES OF zirap_certif_product IN LOCAL MODE
             ENTITY Certificate
             UPDATE
             FIELDS ( Version CertStatus )
             WITH VALUE #( FOR ls_certificate IN lt_certificates ( %tky = ls_certificate-%tky Version = 1 CertStatus = 1 ) ).

    ENDIF.

    " Cria um Status Automaticamente
    DATA: lt_state       TYPE TABLE FOR CREATE zirap_certif_product\_Stats,
          ls_state       LIKE LINE OF lt_state,
          ls_state_value LIKE LINE OF ls_state-%target.


    LOOP AT lt_certificates INTO DATA(ls_cetificates).

      ls_state-%key             = ls_state_value-%key       = ls_cetificates-%key.
      ls_state-CertUuid         = ls_state_value-CertUuid   = ls_cetificates-CertUuid.
      ls_state_value-Matnr      = ls_cetificates-Matnr.
      ls_state_value-Version    = 1.
      ls_state_value-StatusOld  = space.
      ls_state_value-Status     = 1.
      ls_state_value-%cid       = ls_state-CertUuid.

      ls_state_value-%control-CertUuid          = if_abap_behv=>mk-on.
      ls_state_value-%control-Matnr             = if_abap_behv=>mk-on.
      ls_state_value-%control-Version           = if_abap_behv=>mk-on.
      ls_state_value-%control-StatusOld         = if_abap_behv=>mk-on.
      ls_state_value-%control-Status            = if_abap_behv=>mk-on.
      ls_state_value-%control-LastChangedAt     = if_abap_behv=>mk-on.
      ls_state_value-%control-LastChangedBy     = if_abap_behv=>mk-on.

      APPEND ls_state_value TO ls_state-%target.
      APPEND ls_state TO lt_state.

      MODIFY ENTITIES OF zirap_certif_product IN LOCAL MODE
      ENTITY Certificate
      CREATE BY \_Stats
      FROM lt_state
      REPORTED DATA(ls_return_ass)
      MAPPED DATA(ls_mapped_ass)
      FAILED DATA(ls_failed_ass).



    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
