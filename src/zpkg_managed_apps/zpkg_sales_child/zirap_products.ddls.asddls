@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Products'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZIRAP_PRODUCTS as select from ztrap_products
{
    key productid as Productid,
    description as Description,
    value as Value,
    currency as Currency,
    quantity as Quantity,
    unity_measure as UnityMeasure
}
