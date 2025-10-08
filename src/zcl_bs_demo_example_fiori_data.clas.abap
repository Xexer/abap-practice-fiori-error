CLASS zcl_bs_demo_example_fiori_data DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_bs_demo_example_fiori_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA documents TYPE STANDARD TABLE OF zbs_dmo_ex_doc WITH EMPTY KEY.
    DATA positions TYPE STANDARD TABLE OF zbs_dmo_ex_pos WITH EMPTY KEY.
    DATA notes     TYPE STANDARD TABLE OF zbs_dmo_ex_note WITH EMPTY KEY.

    documents = VALUE #( ( document_id = '1000000000' creation_date = '20251001' creation_user = 'ABC' country = 'US' )
                         ( document_id = '1000000001' creation_date = '20251002' creation_user = 'DEF' country = 'DE' )
                         ( document_id = '1000000002' creation_date = '20251003' creation_user = 'ABC' country = 'CH' ) ).

    positions = VALUE #( ( document_id = '1000000000' position_number = '001' customer = 'Electic Factory' amount = 10 )
                         ( document_id = '1000000000' position_number = '002' customer = 'Hourse Ranch' amount = 2 )
                         ( document_id = '1000000001' position_number = '001' customer = 'Bakery' amount = 9 )
                         ( document_id = '1000000001' position_number = '002' customer = 'Stamping shop' amount = 15 )
                         ( document_id = '1000000001' position_number = '003' customer = 'Electic Factory' amount = 1 )
                         ( document_id = '1000000002' position_number = '001' customer = 'Bakery' amount = 7 ) ).

    notes = VALUE #(
        ( document_id = '1000000000' position_number = '001' note_id = '001' description = `Some items from the store` )
        ( document_id = '1000000000' position_number = '001' note_id = '002' description = `Sweets and Goods for Bonnie` )
        ( document_id = '1000000001' position_number = '003' note_id = '001' description = `Ham and Cheese` ) ).

    DELETE FROM zbs_dmo_ex_doc.
    DELETE FROM zbs_dmo_ex_pos.
    DELETE FROM zbs_dmo_ex_note.
    COMMIT WORK.

    INSERT zbs_dmo_ex_doc FROM TABLE @documents.
    INSERT zbs_dmo_ex_pos FROM TABLE @positions.
    INSERT zbs_dmo_ex_note FROM TABLE @notes.
  ENDMETHOD.
ENDCLASS.
