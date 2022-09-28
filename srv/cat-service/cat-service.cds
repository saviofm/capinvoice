using capinvoice as capinvoice from '../../db/data-model';

service CatalogService   /*@( requires:'authenticated-user' )*/ {

    entity Invoice
    /* @(restrict: [ 
            { grant: '*'   , to: 'capinvoice_admin' },
            { grant: 'READ', to: 'authenticated-user' }
    ])*/
        as projection on capinvoice.Invoice;

/*
    entity InvoiceItems 
*/
    /*@(restrict: [ 
            { grant: '*'   , to: 'capinvoice_admin' },
            { grant: 'READ', to: 'authenticated-user' }
    ])*/
/*    
        as projection on capinvoice.InvoiceItems;
*/
};

annotate CatalogService.Invoice with @(
    title              : 'Fatura',
    description        : 'Fatura',
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [senderName, invoiceNumber],
    UI.Identification  : [
        {
            $Type : 'UI.DataField',
            Value : senderName
        },
        {
            $Type : 'UI.DataField',
            Value : invoiceNumber
        }
    ]
) {
    ID                @(
        Core.Computed,
        Common.Text : {
            $value                 : invoiceNumber,
            ![@UI.TextArrangement] : #TextFirst
        }
    );

    invoiceNumber @(
        title       : 'Nr. Fatura',
        description : 'Nr. Fatura',
        Common      : {
            FieldControl             : #Mandatory
        }
    );
    senderName       @(
        title            : 'Remetente',
        description      : 'Remetente',
        Common           : {FieldControl : #Mandatory}
    );
    poNumber @(
        title            : 'Nr. Pedido',
        description      : 'Nr. Pedido',
        Common           : {FieldControl : #Mandatory}
    );

    grossAmount @(
        title            : 'Montante',
        description      : 'Montante'
    );

    invoiceDate @(
        title            : 'Data Fatura',
        description      : 'Data Fatura'
    );

    senderAddress @(
        title            : 'End. Remetente',
        description      : 'End. Remetente'  
    );
    invoiceContent @(
        title            : 'Anexo',
        description      : 'Anexo'
    );

    invoiceContentType@(
        title            : 'Tipo Anexo',
        description      : 'Tipo Anexo'
   );
    invoiceItems @(
        title            : 'Itens',
        description      : 'Itens'
    );

};

//Annotation
/*
annotate CatalogService.InvoiceItems with @(
    title              : 'Itens Fatura',
    description        : 'Itens Fatura',
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [invoice.invoiceNumber, itemNumber],
    UI.Identification  : [{
          $Type : 'UI.DataField',
          Value : itemNumber
      }
    ]
) 
{
  ID             @(
      title       : 'ID',
      description : 'ID',
      Core.Computed,
      Common.Text : {
          $value                 : itemNumber,
          ![@UI.TextArrangement] : #TextOnly
      }
  );
  invoice           @(
      title       : 'Fatura',
      description : 'Fatura',
      Common      : {
          FieldControl             : #Mandatory,
          Text      : {
                $value                 : invoice.invoiceNumber,
                ![@UI.TextArrangement] : #TextOnly
            },
          ValueList                : {
              CollectionPath : 'Invoice',
              SearchSupported: true,
              Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'invoice_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'senderName',

                }
              ]
          }
      }
  );
  itemNumber    @(
      title       : 'Nr. Item',
      description : 'Nr. Item',
      Common      : {
          FieldControl             : #Mandatory,
      }
  );

  itemDescription            @(
      title       : 'Descrição',
      description : 'Descrição',
      Common      : {
          FieldControl             : #Mandatory,
      }
  );
};



*/