@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Virtual element örneği'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_CUSTOMER_VIR
  as select from scustom

{
  key id,

      name,
      city,
      country,

      @ObjectModel.readOnly: true
      @ObjectModel.virtualElement: true
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:YCL_CUSTOMER_VIR'
      cast('' as abap.char(255)) as virtual_greeting
}
