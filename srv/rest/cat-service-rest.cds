using CatalogService as CatalogService from '../cat-service/cat-service';


@protocol : 'rest'
service CatalogRest  {

    entity Invoice as projection on CatalogService.Invoice
    
    entity InvoiceItems as projection on CatalogService.InvoiceItems;

    entity InvoiceStatus as projection on CatalogService.InvoiceStatus;

    entity InvoiceType as projection on CatalogService.InvoiceType;
    
}