@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comsumption - Certificates'
@Metadata.allowExtensions: true
define root view entity ZCRAP_CERTIF_PRODUCT as projection on ZIRAP_CERTIF_PRODUCT
{
    key CertUuid,
    Matnr,
    Description,
    Version,
    CertStatus,
    CertCe,
    CertGs,
    CertFcc,
    CertIso,
    CertTuev,
    LocalLastChangedAt,
    Icon,
    /* Associations */
    _Prod,
    _Stats: redirected to composition child  ZCRAP_CERTIF_ST_PRODUCT
}
