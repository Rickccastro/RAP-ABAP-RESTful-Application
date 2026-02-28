@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Product'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZIRAP_PRODUCT
  as select from ztrap_product
{
  key      matnr       as Matnr,
  key      language    as Language,
           description as Description
}
