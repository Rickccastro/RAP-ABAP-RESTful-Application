@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Cities'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RO_CITY as select from ztrap_city
{
    @EndUserText.label: 'City'
    key id as Id,
    @EndUserText.label: 'Description'
    description as Description
}
