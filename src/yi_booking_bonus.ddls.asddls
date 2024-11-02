@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'CASE kullanımı'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_BOOKING_BONUS
  as select from sbook

{
  key carrid,
  key connid,
  key fldate,
  key bookid,

      cancelled,
      invoice,

      @Semantics.amount.currencyCode: 'loccurkey'
      loccuram,

      loccurkey,

      case
        when cancelled = 'X'
        then cast(loccuram as abap.dec(10,2)) / 100

        when invoice = 'X'
        then cast(loccuram as abap.dec(10,2)) * 10 / 100

        else cast(loccuram as abap.dec(10,2)) * 5 / 100
      end        as bonus_amt
}
