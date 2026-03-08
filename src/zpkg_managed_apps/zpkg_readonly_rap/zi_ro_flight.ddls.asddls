@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Flight Read Only App'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZI_RO_FLIGHT as select from ztrap_flight
{
    key id as Id,
    departure_date as DepartureDate,
    arrival_date as ArrivalDate,
    city_from as CityFrom,
    city_to as CityTo,
    price as Price,
    waers as Waers,
    status as Status
}
