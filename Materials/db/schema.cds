namespace movements;
entity material{
     key MaterialID      : Integer;
    MaterialCode        : String;
    MaterialDesc        : String;
    UOM                 : String;
    MaterialType        : String;
    StorageLocation     : String;
    Status              : String;
    matmovements : Association to many matmovement on matmovements.MaterialID = $self.MaterialID;
}

entity matmovement{
     key MovementID      : Integer;
    MaterialID          : Integer;
    MovementType        : String;
    Plant               : String;
    RefDocType          : String;
    UserID              : String;
    Remarks             : String;
  
     
}