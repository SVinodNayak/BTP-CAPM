namespace maintenance;
entity Equipment {
    key EquipID     : String;
    Description     : String(50);
    Plant           : String;
    Status          : String;
    to_MO: Association to many MaintenanceOrder on to_MO.EquipID = $self.EquipID;
}

entity MaintenanceOrder {
    key MOID    : Integer;
    EquipID    : String(20);
    Priority : String(10);
    StartDate : Date;
    EndDate  : Date;
    Status  : String(15);
    Cost  : Decimal(15,2);
}
