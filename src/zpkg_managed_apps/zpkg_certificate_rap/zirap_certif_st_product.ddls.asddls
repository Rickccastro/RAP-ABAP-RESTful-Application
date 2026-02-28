@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Certification With Status And Product'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZIRAP_CERTIF_ST_PRODUCT
  as select from ZIRAP_CERTIF_ST
  association to parent ZIRAP_CERTIF_PRODUCT as _Certif on $projection.CertUuid = _Certif.CertUuid
  association [1..1] to ZIRAP_PRODUCT as _Prod on  $projection.Matnr = _Prod.Matnr
                                               and _Prod.Language    = $session.system_language
{
  key StateUuid,
      CertUuid,
      Matnr,
      _Prod.Description,
      Version,
      Status,
      StatusOld,
      @Semantics.user.lastChangedBy: true
      LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      _Certif
}
