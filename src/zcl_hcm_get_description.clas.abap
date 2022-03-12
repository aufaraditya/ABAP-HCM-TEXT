CLASS zcl_hcm_get_description DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    CLASS-METHODS get_employee_group_text
      IMPORTING
        !persg      TYPE persg
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_housebank_acc_name
      IMPORTING
        !bukrs      TYPE bukrs
        !hbkid      TYPE hbkid
        !hktid      TYPE hktid
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_abs_type_text
      IMPORTING
        !moabw      TYPE moabw
        !awart      TYPE awart
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_infty_text
      IMPORTING
        !infty      TYPE infty
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_subty_text
      IMPORTING
        !infty      TYPE infty
        !subty      TYPE subty
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_payroll_area_text
      IMPORTING
        !abkrs      TYPE abkrs
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_employee_subgroup_text
      IMPORTING
        !persk      TYPE persk
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_personnel_area_text
      IMPORTING
        !werks      TYPE persa
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_subarea_text
      IMPORTING
        !werks      TYPE persa
        !btrtl      TYPE btrtl
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_position_text
      IMPORTING
        !objid      TYPE hrobjid
      RETURNING
        VALUE(text) TYPE string .
    CLASS-METHODS get_maritstat_text
      IMPORTING
        !famst      TYPE famst
      RETURNING
        VALUE(text) TYPE string .
PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HCM_GET_DESCRIPTION IMPLEMENTATION.


  METHOD get_abs_type_text.

    SELECT SINGLE atext FROM t554t INTO text
   WHERE moabw EQ moabw AND
         awart EQ awart AND
         sprsl EQ sy-langu.

  ENDMETHOD.


  METHOD get_employee_group_text.

    SELECT SINGLE ptext FROM t501t
      INTO text
      WHERE persg EQ persg
        AND sprsl EQ sy-langu.

  ENDMETHOD.


  METHOD get_employee_subgroup_text.

    SELECT SINGLE ptext FROM t503t
      INTO text
      WHERE persk EQ persk
        AND sprsl EQ sy-langu.

  ENDMETHOD.


  METHOD get_housebank_acc_name.

    SELECT SINGLE text1 FROM t012t INTO text
    WHERE hbkid EQ hbkid AND
          hktid EQ hktid AND
          bukrs EQ bukrs AND
          spras EQ sy-langu.
  ENDMETHOD.


  METHOD get_infty_text.

    SELECT SINGLE itext FROM t582s INTO text
    WHERE infty EQ infty AND
     sprsl EQ sy-langu.

  ENDMETHOD.


  METHOD get_maritstat_text.


    SELECT SINGLE ftext FROM t502t INTO text
  WHERE famst EQ famst  AND
    sprsl EQ sy-langu.

  ENDMETHOD.


  METHOD get_payroll_area_text.

    SELECT SINGLE atext FROM t549t INTO text
    WHERE abkrs EQ abkrs AND
          sprsl EQ sy-langu.

  ENDMETHOD.


  METHOD get_personnel_area_text.

    SELECT SINGLE name1 FROM t500p
        INTO text
        WHERE persa EQ werks.


  ENDMETHOD.


  METHOD get_position_text.

    SELECT SINGLE stext FROM hrp1000 INTO text
   WHERE otype EQ 'S' AND
         objid EQ objid.

  ENDMETHOD.


  METHOD get_subarea_text.

    SELECT SINGLE btext FROM t001p
      INTO text
      WHERE werks EQ werks
        AND btrtl EQ btrtl.

  ENDMETHOD.

  METHOD get_subty_text.

    SELECT SINGLE stext FROM t591s INTO text
    WHERE infty EQ infty AND
      subty EQ subty AND
      sprsl EQ sy-langu.

  ENDMETHOD.
ENDCLASS.
