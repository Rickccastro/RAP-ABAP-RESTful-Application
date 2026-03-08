@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Flight City and Status'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZI_RO_FLIGHT_COMPLETE
  as select from ZI_RO_FLIGHT
  association [1..1] to ZI_RO_FLI_STATUS as _Status   on $projection.Status = _Status.Id
  association [1..1] to ZI_RO_CITY       as _CityFrom on $projection.CityFrom = _CityFrom.Id
  association [1..1] to ZI_RO_CITY       as _CityTo   on $projection.CityTo = _CityTo.Id

{
  key Id,
      DepartureDate,
      ArrivalDate,
      CityFrom,
      _CityFrom.Description           as CityFromDescription,
      CityTo,
      _CityTo.Description             as CityToDescription,
      Price,
      Waers,
      Status,
      _Status.Description             as StatusDescription,

      @Semantics.imageUrl: true
      case
        when Status = 1 then 'sap-icon://lateness'
        when Status = 2 then 'sap-icon://accept'
        else 'sap-icon://decline' end as Icon,

      case
      when Status = 1 then 0
      when Status = 2 then 3
      else 1 end   as Criticality,

      _CityFrom,
      _CityTo,
      _Status
}
