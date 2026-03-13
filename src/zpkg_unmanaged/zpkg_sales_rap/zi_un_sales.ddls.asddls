@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Sales'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_UN_SALES as select from ztrap_sales
{
    key orderid as Orderid,
    customer as Customer,
    vendor as Vendor,
    company as Company,
    created_at as CreatedAt,
    local_last_changed_at as LocalLastChangedAt
}
