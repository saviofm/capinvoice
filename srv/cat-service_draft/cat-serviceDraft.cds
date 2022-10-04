using capinvoice as capinvoice from '../../db/data-model';

service CatalogServiceDraft @( requires:'authenticated-user' ) {

    @odata.draft.enabled
    entity InvoiceDraft
     @(restrict: [ 
            { grant: '*'   , to: 'capinvoice_admin' },
            { grant: 'READ', to: 'authenticated-user' }
    ])
        as projection on capinvoice.Invoice;
 
    entity InvoiceItemsDraft 
     @(restrict: [ 
            { grant: '*'   , to: 'capinvoice_admin' },
            { grant: 'READ', to: 'authenticated-user' }
    ])  
        as projection on capinvoice.InvoiceItems;
};
