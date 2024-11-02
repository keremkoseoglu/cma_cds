@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Union komutu'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_FOOD
  as select from    smacourse

    left outer join smealt
      on  smealt.carrid     = smacourse.carrid
      and smealt.mealnumber = smacourse.mealnumber
      and smealt.sprache    = $session.system_language

{
  key smacourse.carrid,
  key smacourse.mealnumber,

      'MAIN_COURSE'         as food_category,
      smealt.text
}

union //all

  select from       sdessert

    left outer join smealt
      on  smealt.carrid     = sdessert.carrid
      and smealt.mealnumber = sdessert.mealnumber
      and smealt.sprache    = $session.system_language

{
  key sdessert.carrid,
  key sdessert.mealnumber,

      'DESSERT'            as food_category,
      smealt.text
}
