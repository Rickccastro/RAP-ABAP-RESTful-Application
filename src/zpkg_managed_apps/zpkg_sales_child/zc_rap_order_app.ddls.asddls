@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comsumption - Order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_ORDER_APP as projection on ZIRAP_ORDER_APP
{
    key Orderid,
    Customer,
    Vendor,
    Company,
    CreatedAt,
    LocalLastChangedAt,
    /* Associations */
    _Items: redirected to composition child ZC_RAP_ORDER_IT_APPS
}
