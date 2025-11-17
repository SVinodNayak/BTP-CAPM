namespace demo;

entity Orders {
    key ID   : Integer;
    item     : String;
    qty      : Integer;
    price    : Decimal(10,2);
}
