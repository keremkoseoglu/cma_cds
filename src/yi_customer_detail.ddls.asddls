@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'String manipulasyon'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity YI_CUSTOMER_DETAIL
  as select from scustom

{
      /* Key fields
         Burada, anahtar alanlar var */

  key id, // ID

      /* Olağan değerler
         Bunlar, veritabanından doğrudan gelir */

      country,
      name,
      form,
      city,
      telephone,

      /* Hesaplanmış veriler
         Bunlar daha kompleks verilerdir */

      // Full name
      case when form = ''
           then name
           else concat_with_space(form, name, 1)
           end                                      as full_name,

      // Temizlenmiş telefon numarası
      replace(replace(telephone, '-', ''), '/', '') as clean_phone,

      // Kısa şehir adı
      left(city, 3)                                 as short_city,

      // Posta kodu format
      case when postcode = '' then ''
           when country = 'DE' then substring(postcode, 1, 2)
           when country = 'GB' then substring(postcode, 1, 3)
           else substring(postcode, 1, 1)
           end                                      as postcode_prefix
}
