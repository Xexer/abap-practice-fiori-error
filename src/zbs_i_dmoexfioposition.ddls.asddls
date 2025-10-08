@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Position'
define view entity ZBS_I_DMOExFioPosition
  as select from zbs_dmo_ex_pos
  association of one to one ZBS_I_DMOExFioDocument as _Document on  _Document.DocumentId = $projection.DocumentId
  association of one to many ZBS_I_DMOExFioNote    as _Notes    on  _Notes.DocumentId     = $projection.DocumentId
                                                                and _Notes.PositionNumber = $projection.PositionNumber
{
  key document_id     as DocumentId,
  key position_number as PositionNumber,
      customer        as Customer,
      amount          as Amount,
      _Document,
      _Notes
}
