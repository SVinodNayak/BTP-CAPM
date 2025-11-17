// using movements from '../db/schema';
// service matservice{
//     entity material as projection on movements.material;
//     entity matmovement as projection on movements.matmovement;
// }
using movements from '../db/schema';

service matservice {

    @UI.HeaderInfo: {
        TypeName: 'Material',
        TypeNamePlural: 'Materials',
        Title: { Value: MaterialDesc }
    }
    @UI.SelectionFields: [MaterialID, MaterialCode, MaterialType, Status]
    @UI.LineItem: [
        {Value: MaterialID, Label: 'Material ID'},
        {Value: MaterialCode, Label: 'Code'},
        {Value: MaterialDesc, Label: 'Description'},
        {Value: UOM, Label: 'UOM'}
        
    ]
     @UI.Identification: [
        {Value: matmovements.MovementID,Label: 'Movement ID'},
        {Value: matmovements.MovementType, Label: 'Type'},
        {Value: matmovements.Plant, Label: 'Plant'},
        {Value: matmovements.RefDocType, Label: 'Reference Doc'},
        {Value: matmovements.UserID, Label: 'User'}
        
     ]
    @UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Material Details',
            Target: '@UI.FieldGroup#MaterialDetails'
        },
        {
          $Type: 'UI.ReferenceFacet',
          Label: 'Material Movements',
          Target: '@UI.Identification'
      }
    ]
    @UI.FieldGroup#MaterialDetails: {
        Data: [
            {Value: MaterialID, Label: 'Material ID'},
            {Value: MaterialCode, Label: 'Material Code'},
            {Value: MaterialDesc, Label: 'Material Description'},
            {Value: UOM, Label: 'UOM'}
           
        ]
    }
    entity material as projection on movements.material;
    
    entity matmovement as projection on movements.matmovement;
}
