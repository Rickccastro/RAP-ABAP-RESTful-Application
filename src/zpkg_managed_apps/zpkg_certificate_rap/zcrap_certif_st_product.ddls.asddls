@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Certification with Status And Product'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCRAP_CERTIF_ST_PRODUCT as projection on ZIRAP_CERTIF_ST_PRODUCT
{
    key StateUuid,
    CertUuid,
    Matnr,
    Description,
    Version,
    Status,
    StatusOld,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Certif: redirected to parent ZCRAP_CERTIF_PRODUCT
}
