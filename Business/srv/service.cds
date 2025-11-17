using business from'../db/schema';
service track {
    
    entity Bus_Partners as projection on business.Bus_Partners;
    entity Pur_Orders as projection on business.Pur_Orders;
}