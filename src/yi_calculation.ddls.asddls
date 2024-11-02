@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'CDS''lerde hesaplama yapmak'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_CALCULATION
  as select from sflight

    inner join   spfli
      on  spfli.carrid = sflight.carrid
      and spfli.connid = sflight.connid

{
  key sflight.carrid,
  key sflight.connid,
  key sflight.fldate,

      @Semantics.amount.currencyCode: 'currency'
      sflight.price,

      sflight.currency,
      spfli.distid,
      spfli.fltime,

      // Temel aritmetik
      spfli.fltime / 2                                        as half_fltime,

      // Yuvarlama
      ceil(spfli.fltime / 2)                                  as ceiling_half_fltime,
      floor(spfli.fltime / 2)                                 as floor_half_fltime,

      @Semantics.amount.currencyCode: 'currency'
      round(sflight.price, 0)                                 as rounded_price,

      round(cast(sflight.price as abap.dec(10,2)), 0)         as cast_rounded_price,

      // Mutlak değer
      abs(spfli.fltime - 1000)                                as abs_diff_from_1k,

      // Tarih saat hesapları
      dats_add_days(sflight.fldate, 30, 'INITIAL')            as after_30_days,
      dats_add_months(sflight.fldate, 2, 'INITIAL')           as after_2_months,
      dats_days_between(sflight.fldate, $session.system_date) as days_passed
}
