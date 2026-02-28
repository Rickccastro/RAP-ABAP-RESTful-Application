@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface(Basic)Status  Certification'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZIRAP_CERTIF_ST
  as select from ztrap_certif_st
{
  key state_uuid            as StateUuid,
      cert_uuid             as CertUuid,
      matnr                 as Matnr,
      version               as Version,
      status                as Status,
      status_old            as StatusOld,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt
}
