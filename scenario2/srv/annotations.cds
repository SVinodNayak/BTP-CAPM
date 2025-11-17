using {DatamodelService as service} from '../srv/service';
 
annotate service.PurchaseOrders @(UI:{
    odata.draft.enabled,
    Capabilities : { Insertable: true,Deletable: true,Updatable: true
    },
 
    HeaderInfo: {
        TypeName: 'Purchase Order',
        TypeNamePlural: 'Purchase Orders'
    },
    LineItem: [
        { Value: NODE_KEY, Label: 'CUID' },
        { Value: PO_ID, Label: 'PO ID' },
        { Value: PARTNER_GUID_NODE_KEY, Label: 'Partner GUID' },
        { Value: CURRENCY_CODE, Label: '{i18n>Currency}' },
        { Value: GROSS_AMOUNT, Label: '{i18n>GrossAmount}' },
        { Value: LIFECYCLE_STATUS, Label: '{i18n>LifecycleStatus}' },
        { Value: OVERALL_STATUS, Label: '{i18n>OverallStatus}' },
        { Value: NET_AMOUNT, Label: 'Total Amount' }
    ],
    FieldGroup#one: {
        Label: 'PO Details',
        Data: [
            { Value: NODE_KEY, Label: 'CUID' },
            { Value: PO_ID, Label: 'PO ID' },
            { Value: CURRENCY_code, Label: '{i18n>Currency}' },
            { Value: GROSS_AMOUNT, Label: 'Gross Amount' },
            { Value: LIFECYCLE_STATUS, Label: 'Status' }
        ]
    },
    Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'General Information',
            Target: '@UI.FieldGroup#one'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Purchase Order Items',
            Target: 'Items/@UI.LineItem'
        }
    ]
}
   
   
);
annotate service.POItems @(
    UI.LineItem: [
        { Value: NODE_KEY, Label: 'CUID' },
        { Value: CURRENCY_code, Label: '{i18n>Currency}' },
        { Value: NET_AMOUNT, Label: '{i18n>NetAmount}' },
        { Value: TAX_AMOUNT, Label: 'Tax Amount' },
        { Value: GROSS_AMOUNT, Label: 'Gross Amount' }
    ]
   
 
)