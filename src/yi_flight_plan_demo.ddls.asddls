@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Hello World'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_FLIGHT_PLAN_DEMO
  as select from spfli

    inner join   sairport as _from on _from.id = spfli.airpfrom
    inner join   sairport as _to   on _to.id = spfli.airpto

{
  key spfli.carrid,
  key spfli.connid,

      spfli.airpfrom,
      spfli.airpto,
      _from.name      as from_name,
      _to.name        as to_name
}
