@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Notes'
define view entity ZBS_I_DMOExFioNote
  as select from zbs_dmo_ex_note
  association of one to one ZBS_I_DMOExFioDocument as _Document on  _Document.DocumentId = $projection.DocumentId
  association of one to one ZBS_I_DMOExFioPosition as _Position on  _Position.DocumentId     = $projection.DocumentId
                                                                and _Position.PositionNumber = $projection.PositionNumber
{
  key document_id     as DocumentId,
  key position_number as PositionNumber,
  key note_id         as NoteId,
      description     as Description,
      _Document,
      _Position
}
