using empservice as service from '../../srv/emp_srv';
annotate service.employee with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'emp_id',
                Value : emp_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'emp_name',
                Value : emp_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'salary',
                Value : salary,
            },
            {
                $Type : 'UI.DataField',
                Label : 'dept_id',
                Value : dept_id,
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
            ID : 'GeneratedFacet01',
            Label : 'General Information',
            Target : 'department/@UI.LineItem',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'emp_id',
            Value : emp_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'emp_name',
            Value : emp_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'salary',
            Value : salary,
        },
        {
            $Type : 'UI.DataField',
            Label : 'dept_id',
            Value : dept_id,
        },
    ],
);
//ikj
annotate service.dept with @(
   
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'General Information',
            Target : '@UI.LineItem',
        },
        
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'dept id',
            Value : dept_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'dept_name',
            Value : dept_name,
        },
       
    ],
);