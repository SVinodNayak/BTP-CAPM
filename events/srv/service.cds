using demo from '../db/schema';

service Events {
    entity Orders as projection on demo.Orders;
}
