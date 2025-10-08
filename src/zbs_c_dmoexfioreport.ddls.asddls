@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reporting'
@Metadata.allowExtensions: true
define root view entity ZBS_C_DMOExFioReport
  provider contract transactional_query
  as projection on ZBS_I_DMOExFioReport
{
  key DocumentId,
      CreationDate,
      CountryName,
      PositionNumber,
      Customer,
      NoteId,
      Description
}
