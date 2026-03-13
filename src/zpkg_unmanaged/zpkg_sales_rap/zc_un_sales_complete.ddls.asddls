@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Sales'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_UN_SALES_COMPLETE as projection on ZI_UN_SALES_COMPLETE
{
    key Orderid,
    Customer,
    Vendor,
    Company,
    CreatedAt,
    LocalLastChangedAt
}
