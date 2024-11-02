@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'NOT EXISTS sağlayacak Workaround'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_AIRPORT_WO_PLAN
  as select from sairport

  association [0..1] to spfli as _fake_flight_from on _fake_flight_from.airpfrom = $projection.id
  association [0..1] to spfli as _fake_flight_to   on _fake_flight_to.airpfrom = $projection.id

{
  key sairport.id
}

where _fake_flight_from.carrid is null // NOT EXISTS demek
  and _fake_flight_to.carrid   is null // NOT EXISTS demek
