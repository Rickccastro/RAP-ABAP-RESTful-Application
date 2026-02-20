@AbapCatalog.sqlViewAppendName: 'ZVW_EXTEND_BKPF'
@EndUserText.label: 'Extend BKPF'
extend view I_AccountingDocument with ZI_EXTEND_BKPF
{
    bkpf.zzfieldrap1
}
