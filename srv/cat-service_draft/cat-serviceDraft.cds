using capinvoice as capinvoice from '../../db/data-model';

service CatalogServiceDraft   /*@( requires:'authenticated-user' )*/ {

    entity InvoiceDraft
    /* @(restrict: [ 
            { grant: '*'   , to: 'capinvoice_admin' },
            { grant: 'READ', to: 'authenticated-user' }
    ])*/
        as projection on capinvoice.Invoice;
 
    entity InvoiceItemsDraft   
        as projection on capinvoice.InvoiceItems;
};