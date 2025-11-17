namespace business;

entity BSpartners {
    key BPID    : Integer;
    BPName      : String;
    BPType      : String;
    Country     : String;
    City        : String;
}

entity Salesorder {
    key SOID       : Integer;
    BPID           : Integer;
    SODate         : Date;
    Currency       : String;
    NetAmount      : Decimal(15,2);
    Status         : String;
    to_BP : Association to many BSpartners on to_BP.BPID = BPID;
}
