using CatalogService as CatalogService from '../cat-service/cat-service';


@protocol : 'rest'
service CatalogRest  {

    entity Invoice as projection on CatalogService.Invoice;

    
}