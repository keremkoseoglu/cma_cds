@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Parametreli CDS çağırma'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_USER_COUNTRY_ON_DATE_CONS
  as select from YI_USER_COUNTRY_ON_DATE(
                   key_date : $session.system_date) as _uc

{
  key _uc.bname,

      _uc.name1,
      _uc.country,
      _uc.landx
}
