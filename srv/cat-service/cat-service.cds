using capinvoice as capinvoice from '../../db/data-model';

service CatalogService    {

    entity Invoice
        as projection on capinvoice.Invoice;

    entity InvoiceItems
        as projection on capinvoice.InvoiceItems;
    entity InvoiceStatus
        as projection on capinvoice.InvoiceStatus;

    entity InvoiceType
        as projection on capinvoice.InvoiceType;

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
    invoiceType @(
        title            : 'Tp. Invoice',
        description      : 'Tp. Invoice',
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
    invoiceStatus@(
        title            : 'Status',
        description      : 'Status'  
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
