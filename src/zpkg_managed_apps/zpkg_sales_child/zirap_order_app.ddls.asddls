@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Sales'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZIRAP_ORDER_APP as select from ZIRAP_ORDER
composition [1..*] of ZIRAP_ORDER_IT_APP as _Items
{
    key Orderid,
    Customer,
    Vendor,
    Company,
    CreatedAt,
    LocalLastChangedAt,
    _Items
}
