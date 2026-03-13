@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Order Items'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZIRAP_ORDER_IT as select from ztrap_order_it
{
    key orderid as Orderid,
    key item as Item,
    product as Product,
    quantity as Quantity,
    unity_measure as UnityMeasure
}
