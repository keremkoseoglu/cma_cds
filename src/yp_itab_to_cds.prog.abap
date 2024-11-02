REPORT yp_itab_to_cds.

START-OF-SELECTION.
  SELECT * FROM scarr WHERE currcode = 'EUR' INTO TABLE @DATA(eur_carriers).

  SELECT FROM @eur_carriers                         AS _itab
              INNER JOIN yi_flight_association_cons AS _cds
                ON _cds~carrid = _itab~carrid
         FIELDS _cds~*
         INTO TABLE @DATA(cds_results).

*  SELECT FROM yi_flight_association_cons AS _cds
*         FIELDS *
*         FOR ALL ENTRIES IN @eur_carriers
*         WHERE _cds~carrid = @eur_carriers-carrid
*         INTO TABLE @DATA(cds_results_2).

  cl_salv_table=>factory( IMPORTING r_salv_table = DATA(alv)
                          CHANGING  t_table      = cds_results ).

  alv->display( ).
