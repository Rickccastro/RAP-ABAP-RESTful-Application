@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Flight City and Status'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_RO_FLIGHT_COMPLETE as select from ZI_RO_FLIGHT_COMPLETE
{
    @Search.defaultSearchElement: true
    key Id,
    @Consumption.filter:{ selectionType: #INTERVAL }
    DepartureDate,
    @Consumption.filter:{ selectionType: #INTERVAL }
    ArrivalDate,
    @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZI_RO_CITY', element: 'Id' } }]
    @ObjectModel.text.element: [ 'CityFromDescription' ]
    CityFrom,
    @Search.defaultSearchElement: true
    CityFromDescription,
    @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZI_RO_CITY', element: 'Id' } }]
    @ObjectModel.text.element: [ 'CityToDescription' ]
    CityTo,
    @Search.defaultSearchElement: true
    CityToDescription,
    Price,
    Waers,
    @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZI_RO_FLI_STATUS', element: 'Id' } }]
    @ObjectModel.text.element: [ 'StatusDescription' ]
    Status,
    StatusDescription,
    Icon,
    Criticality,
    /* Associations */
    _CityFrom,
    _CityTo,
    _Status
}
