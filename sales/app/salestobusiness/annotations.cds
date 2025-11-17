using trackorder as service from '../../srv/oredersrv';
annotate service.Salesorder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'SOID',
                Value : to_BP.BPID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'BPID',
                Value : to_BP.BPName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SODate',
                Value : to_BP.BPType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Currency',
                Value : to_BP.City,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NetAmount',
                Value : to_BP.Country,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : Status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'Business Partner Info',
            Target : 'to_BP/@UI.LineItem',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Track sales',
            ID : '1',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'SOID',
            Value : SOID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'BPID',
            Value : BPID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SODate',
            Value : SODate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency',
            Value : Currency,
        },
        {
            $Type : 'UI.DataField',
            Label : 'NetAmount',
            Value : NetAmount,
        },
    ],
);

annotate service.BSpartners with @(
 UI.LineItem : [
        
        {
            $Type : 'UI.DataField',
            Label : 'BPID',
            Value : BPID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'BPName',
            Value : BPName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'BPType',
            Value : BPType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Country',
            Value : Country,
        },
        {
            $Type : 'UI.DataField',
            Label : 'City',
            Value : City,

        },
    ],
    UI.SelectionFields : [
        BPID,
        BPName,
    ],
);


