using demo from '../db/demo';
service orderinfo{
    entity orders as projection on demo.orders{
        id,
        name,
        price
    };
}