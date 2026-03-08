@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Status Flight'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_RO_FLI_STATUS as select from ztrap_fli_status
{
    @EndUserText.label: 'Status'
    key id as Id,
    @EndUserText.label: 'Description'
    description as Description
}
