using po.ust from '../db/schema';


 service master{
    entity vendormaster as projection on ust.vendormaster;
    entity mastermaterial as projection on ust.mastermaterial;

 }

 service purchaseorder {
    entity poheader as projection on ust.poheader;
    entity poitems as projection on ust.poitems;
 }
 service invoice{
    entity inv_header as projection on ust.inv_header;
    entity inv_items as projection on ust.inv_items;
 }

 service GR {
    entity gr_header as projection on ust.gr_header;
    entity gr_items as projection on ust.gr_items;
 }
 service audit {
    entity audit as projection on ust.audit;
    
 
 }