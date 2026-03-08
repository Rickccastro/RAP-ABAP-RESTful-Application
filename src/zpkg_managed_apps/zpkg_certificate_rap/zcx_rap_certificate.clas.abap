CLASS zcx_rap_certificate DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA lv_attr1 TYPE string READ-ONLY.
    DATA lv_attr2 TYPE string READ-ONLY.
    DATA lv_attr3 TYPE string READ-ONLY.
    DATA lv_attr4 TYPE string READ-ONLY.

    CONSTANTS: BEGIN OF material_unknown,
               msgid TYPE symsgid VALUE 'ZCL_MESSAGES',
               msgno TYPE symsgno VALUE '001',
               attr1 TYPE scx_attrname VALUE 'lv_attr1',
               attr2 TYPE scx_attrname VALUE 'lv_attr2',
               attr3 TYPE scx_attrname VALUE 'lv_attr3',
               attr4 TYPE scx_attrname VALUE 'lv_attr4',
               END OF   material_unknown.

    METHODS constructor
      IMPORTING
        severity TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid   LIKE if_t100_message=>t100key OPTIONAL
        previous TYPE REF TO cx_root OPTIONAL
        iv_attr1 TYPE string OPTIONAL
        iv_attr2 TYPE string OPTIONAL
        iv_attr3 TYPE string OPTIONAL
        iv_attr4 TYPE string OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_rap_certificate IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->lv_attr1 = |{ iv_attr1 ALPHA = OUT }|.
    me->lv_attr2 = |{ iv_attr2 ALPHA = OUT }|.
    me->lv_attr3 = |{ iv_attr3 ALPHA = OUT }|.
    me->lv_attr4 = |{ iv_attr4 ALPHA = OUT }|.

  ENDMETHOD.
ENDCLASS.
