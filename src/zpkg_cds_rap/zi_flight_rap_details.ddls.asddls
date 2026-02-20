@AbapCatalog.sqlViewName: 'ZI_FLIGHTRAP_D_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Details from ZI_FLIGHT_RAP'
define view ZI_FLIGHT_RAP_DETAILS
  with parameters
    P_CurrencyCode : abap.cuky( 5 )
  as select from ZI_FLIGHT_RAP
  association [1..1] to /DMO/I_Carrier    as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection as _Connection on  $projection.ConnectionId = _Connection.ConnectionID
                                                         and $projection.CarrierId    = _Connection.AirlineID
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.currencyCode: true
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      _Carrier.Name,
      _Connection.ArrivalTime,
      
      
      case when SeatsMax < 260 then 'Small'
           when SeatsMax >= 260 and SeatsMax < 300  then 'Medium'
           else 'Big' end as SizeFlight,
      
      _Carrier,
      _Connection

}
where
      FlightDate   <= $session.system_date
  and CurrencyCode = :P_CurrencyCode
