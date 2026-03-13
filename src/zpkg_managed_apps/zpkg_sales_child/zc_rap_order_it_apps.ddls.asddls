@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comsumption - Order Items'
@Metadata.ignorePropagatedAnnotations: false

@Metadata.allowExtensions: true
define view entity ZC_RAP_ORDER_IT_APPS as projection on ZIRAP_ORDER_IT_APP
{
    key Orderid,
    key Item,
    Product,
    Description,
    Value,
    Currency,
    Quantity,
    UnityMeasure,
    SalesPrice,
    /* Associations */
    _Order : redirected to parent ZC_RAP_ORDER_APP,
    _Product
}
