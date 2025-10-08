@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reporting'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZBS_I_DMOExFioReport
  as select from ZBS_I_DMOExFioDocument
{
  key DocumentId,
      CreationDate,
      _Country._Text[ Language = $session.system_language ].CountryName,
      _Position.PositionNumber,
      _Position.Customer,
      _Position._Notes.NoteId,
      _Position._Notes.Description
}
