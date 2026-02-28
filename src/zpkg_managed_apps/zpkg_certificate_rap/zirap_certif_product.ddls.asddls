@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Certification With Product'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZIRAP_CERTIF_PRODUCT
  as select from ZIRAP_CERTIF
  composition [1..*] of ZIRAP_CERTIF_ST_PRODUCT as _Stats
  association [1..1] to ZIRAP_PRODUCT as _Prod on  $projection.Matnr = _Prod.Matnr
                                               and _Prod.Language    = $session.system_language
{
  key CertUuid,
      Matnr,
      _Prod.Description as Description,
      Version,
      CertStatus,
      CertCe,
      CertGs,
      CertFcc,
      CertIso,
      CertTuev,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.imageUrl: true
      'sap-icon://document-text' as Icon,
      _Prod,
      _Stats
}
