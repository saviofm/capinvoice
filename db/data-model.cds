using {
  cuid,
  managed,
  sap,
  temporal,
  Currency,
  User
} from '@sap/cds/common';


namespace capinvoice;
//----------------------- Invoice  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//

//Entity
entity Invoice: cuid, managed {
  invoiceNumber: String;
  senderName: String;
  poNumber: String;
  invoiceType: Association to one InvoiceType;
  grossAmount: Integer;
  invoiceDate: Date ;
  senderAddress: String;
  invoiceStatus: Association to one InvoiceStatus;
  invoiceContent:  LargeBinary @Core.MediaType: invoiceContentType;
  invoiceContentType: String @Core.IsMediaType: true;
  invoiceItems: Composition of many InvoiceItems on invoiceItems.invoice = $self;
};


//Annotation
annotate Invoice with @(
    title              : '{i18n>Invoice}',
    description        : '{i18n>Invoice}',
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
        title       : '{i18n>invoiceNumber}',
        description : '{i18n>invoiceNumber}',
        Common      : {
            FieldControl             : #Mandatory
        }
    );
    senderName       @(
        title            : '{i18n>senderName}',
        description      : '{i18n>senderName}',
        Common           : {FieldControl : #Mandatory}
    );
    poNumber @(
        title            : '{i18n>poNumber}',
        description      : '{i18n>poNumber}',
        Common           : {FieldControl : #Mandatory}
    );
    invoiceType @(
        title       : '{i18n>invoiceType}',
        description : '{i18n>invoiceType}',
        Common      : {           
          Text      : {
                $value                 : invoiceType.txtInvoiceType,
                ![@UI.TextArrangement] : #TextOnly
            },
          //ValueListWithFixedValues : false,
          ValueList                : {
                CollectionPath : 'InvoiceType',
                SearchSupported: true,
                Parameters     : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'invoiceType_invoiceType',
                        ValueListProperty : 'invoiceType'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'txtInvoiceType'

                    }
                ]
            }
        }
    );

    grossAmount @(
        title            : '{i18n>grossAmount}',
        description      : '{i18n>grossAmount}'
    );

    invoiceDate @(
        title            : '{i18n>invoiceDate}',
        description      : '{i18n>invoiceDate}'
    );

    senderAddress @(
        title            : '{i18n>senderAddress}',
        description      : '{i18n>senderAddress}'  
    );
    invoiceStatus @(
    title       : '{i18n>invoiceStatus}',
    description : '{i18n>invoiceStatus}',
    Common      : {
          
          Text      : {
                $value                 : invoiceStatus.txtInvoiceStatus,
                ![@UI.TextArrangement] : #TextOnly
            },
          //ValueListWithFixedValues : false,
          ValueList                : {
              CollectionPath : 'InvoiceStatus',
              SearchSupported: true,
              Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'invoiceStatus_invoiceStatus',
                    ValueListProperty : 'invoiceStatus'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'txtInvoiceStatus'
                }
              ]
          }
      }
  );
    invoiceContent @(
        title            : '{i18n>invoiceContent}',
        description      : '{i18n>invoiceContent}'
    );

    invoiceContentType@(
        title            : '{i18n>invoiceContentType}',
        description      : '{i18n>invoiceContentType}'
   );
    invoiceItems @(
        title            : '{i18n>invoiceItems}',
        description      : '{i18n>invoiceItems}'
    );

};


//----------------------- InvoiceItems  ---------------------//
//----------------------------------------------------------//
//---------------------------------------------------------//
//Entity
entity InvoiceItems : cuid , managed {
  invoice : Association to Invoice;
  itemNumber: String;
  itemDescription: String;
};

//Annotation
annotate InvoiceItems with @(
    title              : '{i18n>InvoiceItems}',
    description        : '{i18n>InvoiceItems}',
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
      title       : '{i18n>invoice}',
      description : '{i18n>invoice}',
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
                    ValueListProperty : 'invoiceNumber',

                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'senderName'
                }
              ]
          }
      }
  );
  itemNumber    @(
      title       : '{i18n>itemNumber}',
      description : '{i18n>itemNumber}',
      Common      : {
          FieldControl             : #Mandatory,
      }
  );

  itemDescription            @(
      title       : '{i18n>itemDescription}',
      description : '{i18n>itemDescription}',
      Common      : {
          FieldControl             : #Mandatory,
      }
  );
};


//----------------- Invoice Status --------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
@cds.odata.valuelist
entity InvoiceStatus {
    key invoiceStatus : Integer not null;
        txtInvoiceStatus  : localized String;
};
//Annotation     
annotate InvoiceStatus with @(
    title              : '{i18n>InvoiceStatus}',
    description        : txtInvoiceStatus,
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [txtInvoiceStatus],
    UI.Identification  : [{
        $Type : 'UI.DataField',
        Value : txtInvoiceStatus
    }]
) {
    invoiceStatus @(
        title       : '{i18n>InvoiceStatus}',
        description : '{i18n>InvoiceStatus}',
        Common.Text : {
            $value                 : txtInvoiceStatus,
            ![@UI.TextArrangement] : #TextOnly
        }
    );

    txtInvoiceStatus  @(
        title       : '{i18n>txtInvoiceStatus}',
        description : '{i18n>txtInvoiceStatus}',
        Common      : {
            FieldControl             : #Mandatory,
            TextFor                  : invoiceStatus
        }
    );
};

//----------------- Invoice Type --------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
@cds.odata.valuelist
entity InvoiceType {
    key invoiceType : String not null;
        txtInvoiceType  : localized String;
};
//Annotation     
annotate InvoiceType with @(
    title              : '{i18n>InvoiceType}',
    description        : txtInvoiceType,
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [txtInvoiceType],
    UI.Identification  : [{
        $Type : 'UI.DataField',
        Value : txtInvoiceType
    }]
) {
    invoiceType @(
        title       : '{i18n>InvoiceType}',
        description : '{i18n>InvoiceType}',
        Common.Text : {
            $value                 : txtInvoiceType,
            ![@UI.TextArrangement] : #TextOnly
        }
    );

    txtInvoiceType  @(
        title       : '{i18n>txtInvoiceType}',
        description : '{i18n>txtInvoiceType}',
        Common      : {
            FieldControl             : #Mandatory,
            TextFor                  : invoiceType
        }
    );
};