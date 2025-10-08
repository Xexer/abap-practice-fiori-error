@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Document'
define view entity ZBS_I_DMOExFioDocument
  as select from zbs_dmo_ex_doc
  association of one to many ZBS_I_DMOExFioPosition as _Position on _Position.DocumentId = $projection.DocumentId
  association of one to one I_Country               as _Country  on _Country.Country = $projection.Country
{
  key document_id   as DocumentId,
      creation_date as CreationDate,
      creation_user as CreationUser,
      country       as Country,
      _Position,
      _Country
}
