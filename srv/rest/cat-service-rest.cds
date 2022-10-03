using CatalogService as CatalogService from '../cat-service/cat-service';


@protocol : 'rest'
service CatalogRest  /*@( requires:'authenticated-user' )*/{

    entity Invoice as projection on CatalogService.Invoice;

    
}