@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Order'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZIRAP_ORDER as select from ztrap_order
{
    key orderid as Orderid,
    customer as Customer,
    vendor as Vendor,
    company as Company,
    created_at as CreatedAt,
    local_last_changed_at as LocalLastChangedAt
}
