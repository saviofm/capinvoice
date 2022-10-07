using CatalogServiceDraft from './cat-serviceDraft';

//----------------------- Invoice  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogServiceDraft.InvoiceDraft with @(
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: invoiceNumber,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : senderName,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : poNumber,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : invoiceType.txtInvoiceType,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : grossAmount,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : invoiceDate,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : invoiceStatus.txtInvoiceStatus,
                ![@UI.Importance] : #High
            },
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : invoiceNumber}]
        },
        SelectionFields: [ 
            invoiceNumber,
            invoiceDate,
            poNumber
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: invoiceNumber
            },
            TypeName: '{i18n>Invoice}',
            TypeNamePlural: '{i18n>Invoices}',
            Description: { 
                Value: senderName 
            }, 
        },
		HeaderFacets            : [

            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: invoiceNumber
                },
                {
                    $Type : 'UI.DataField',
                    Value: senderName
                },                
                {
                    $Type : 'UI.DataField',
                    Value: poNumber
                },
                {
                    $Type : 'UI.DataField',
                    Value: invoiceType_invoiceType,
                    // ![@Common.FieldControl] : #ReadOnly,
                    ![@UI.Importance] : #Low
                },
                {
                    $Type : 'UI.DataField',
                    Value: grossAmount
                },
                {
                    $Type : 'UI.DataField',
                    Value: invoiceDate
                },    
                {
                    $Type : 'UI.DataField',
                    Value: senderAddress
                }, 
                {
                    $Type : 'UI.DataField',
                    Value: senderAddress
                },
                {
                    $Type : 'UI.DataField',
                    Value: invoiceStatus_invoiceStatus,
                    // ![@Common.FieldControl] : #ReadOnly,
                    ![@UI.Importance] : #Low
                }          
			]                        
        },
        FieldGroup #Image: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : invoiceContent,
                    Label : ''        
                }
            ]
        },
        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        // Page Facets
		Facets: [
            {
                $Type: 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#Image',
                Label: '{i18n>Image}', 
            },
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            },
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>invoiceItems}', 
                Target: 'invoiceItems/@UI.LineItem'
            },
        ]    
    }
);


//------------------- Invoice Items  -------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate CatalogServiceDraft.InvoiceItemsDraft with @( 
   	UI: {
    	TextArrangement     : #TextOnly,
        LineItem: [           
			{
                $Type             : 'UI.DataField',
                Value             : itemNumber,
                ![@UI.Importance] : #High
            },            
            {   
                $Type             : 'UI.DataField',
                Value             : itemDescription,
                ![@UI.Importance] : #High
            },
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : itemNumber}]
        }
    },
// Object Header
    UI: { 
        HeaderInfo: {         
            Title: {
                $Type : 'UI.DataField',
                Value : '{i18n>InvoiceItems}'
            },    
            TypeName       : '{i18n>Item}',
            TypeNamePlural : '{i18n>Items}',
            Description    : {
                Value : '{i18n>InvoiceItems}'
            }
        },    
        FieldGroup #Details : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : itemNumber,
                    ![@UI.Importance] : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : itemDescription,
                    ![@UI.Importance] : #High
                }        
            ]
        },
    // Page Facets
        Facets : [
            {
                $Type  : 'UI.CollectionFacet',
                ID     : 'InvoiceDetails',
                Label  : '{i18n>Details}',
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        Label  : '{i18n>Details}',
                        Target : '@UI.FieldGroup#Details'
                    }
                ]
            }
        ]
    }  
);
