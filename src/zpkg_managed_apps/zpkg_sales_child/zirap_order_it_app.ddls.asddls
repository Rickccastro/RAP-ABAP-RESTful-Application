@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Sales Order items'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZIRAP_ORDER_IT_APP as select from ZIRAP_ORDER_IT
association to parent ZIRAP_ORDER_APP as _Order on $projection.Orderid = _Order.Orderid
association [1..1] to ZIRAP_PRODUCTS as _Product on $projection.Product = _Product.Productid
{
    key Orderid,
    key Item,
    Product,
    _Product.Description,
    _Product.Value,
    _Product.Currency,
    Quantity,
    UnityMeasure,
    cast(_Product.Value as abap.dec(10,2) ) * cast(Quantity as abap.dec(10,2) ) as SalesPrice,
    _Order,
    _Product
}
