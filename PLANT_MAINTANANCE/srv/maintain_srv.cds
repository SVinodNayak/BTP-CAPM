using maintenance from '../db/schema';
service MaintenanceService {
    entity Equipment as projection on maintenance.Equipment;
    @UI.HeaderInfo:{
        TypeName        : 'Maintenance Order',
        TypeNamePlural  : 'Maintenance Orders',
        Title           : { Value : MOID },
        Description     : { Value : to_Equipment.Description }
    }
    entity MaintenanceOrder as projection on maintenance.MaintenanceOrder;
}
