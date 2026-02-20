@EndUserText.label: 'Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CUSTOMENTITY'
define custom entity ZI_FLIGHT_RAP_CUSTOM_ENTITY
{
      @UI.selectionField: [{position:10}]
      @UI.lineItem  : [{position:10}]
      @EndUserText.label: 'AirCompany'
  key carrier_id    : /dmo/carrier_id;
  
      @UI.selectionField: [{position:20}]
      @UI.lineItem  : [{position:20}]
      @EndUserText.label: 'Connection'
  key connection_id : /dmo/connection_id;
  
      @UI.selectionField: [{position:30}]
      @UI.lineItem  : [{position:30}]
      @EndUserText.label: 'Flight Date'
  key flight_date   : /dmo/flight_date;

}
