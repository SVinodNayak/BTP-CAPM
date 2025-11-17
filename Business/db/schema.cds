namespace business;

entity Bus_Partners {
    key BPID : Integer;
    BPName : String;
    BPType  : String;
    Country  : String;
    City   : String;
    Phone  : String;
    Email  : String;

    purchaseOrders : Association to many Pur_Orders
                        on purchaseOrders.VendorID = $self.BPID;
}

entity Pur_Orders {
    key POID       : Integer;
    VendorID       : Integer;
    POType         : String;
    Plant          : String;
    POStatus       : String;
    CreatedBy      : String;
    Remarks        : String;

}
