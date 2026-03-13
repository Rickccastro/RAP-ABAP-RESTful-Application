@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Sales'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_UN_SALES_COMPLETE as select from ZI_UN_SALES
{
    key Orderid,
    Customer,
    Vendor,
    Company,
    CreatedAt,
    LocalLastChangedAt
}
