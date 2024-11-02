@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Alan eklenecek ana CDS'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_FLIGHT_MASTER
  as select from sflight

  association [1..1] to scarr as _carrier on _carrier.carrid = $projection.carrid

{
  key sflight.carrid,
  key sflight.connid,
  key sflight.fldate,

      @Semantics.amount.currencyCode: 'currency'
      sflight.price,

      sflight.currency,

      _carrier
}
