using { ust.vinod.nayak.datamodel as db } from '../db/datamodel';

service DatamodelService {

    entity BusinessPartners as projection on db.master.businesspartner;
    entity Addresses as projection on db.master.address;
    entity Products  as projection on db.master.product;
    entity PurchaseOrders as projection on db.transaction.purchaseorder;
    entity POItems as projection on db.transaction.poitems;
}
