using capinvoice as capinvoice from '../../db/data-model';

service CatalogServiceDraft  {

    @odata.draft.enabled
    entity InvoiceDraft
        as projection on capinvoice.Invoice;
 
    entity InvoiceItemsDraft 
        as projection on capinvoice.InvoiceItems;

    entity InvoiceTypeDraft
        as projection on capinvoice.InvoiceType;
    entity InvoiceStatusDraft
        as projection on capinvoice.InvoiceStatus; 
};
