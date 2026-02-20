@AbapCatalog.sqlViewName: 'ZI_FLIGHT_RAP_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic) Flights'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_FLIGHT_RAP
  as select from /dmo/flight association [1..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,
      _Currency.CurrencyISOCode as IsoCode,
      _Currency
}
