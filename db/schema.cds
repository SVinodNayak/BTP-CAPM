namespace po.ust;
using { managed, cuid } from '@sap/cds/common';

aspect primary: managed, cuid {}


type addresses {
    vm_street:String(30) default 'mkstreets'  ;
    vm_city:String(15) default 'mbnr';
    vm_state:String(15) default 'telangana';
    vm_country:String(15) default 'India';
    vm_postal:Integer default '509202';
}
type material_type {
    raw_material:String(15) default 'Steel';
    material_srv:String(2) default 'MA';
    others:String(10);
}

type uom {
    uom :String(2) default 'KG';
}
type currency {
    cuky: String(3) default 'USD';
}
type payment_terms {
 
    vendor : vendormaster:vm_code default 'N/A';
}

type status : String enum { draft ; approved; rejected; verified; submitted; cancelled; other= 'N/A';}

type approved_aspect{
    po_approvedby : String(50) default 'BTP APPROVED';
    po_approvedat : DateTime;
}
type Quantity {
    order_quan :Integer default 0;
}
type report_status : String enum{
    open ; Partiallyreceived;fullyReceived;cancelled;
}
type post_aspect {
    postedat:DateTime;
    postedby:String(5);
    verifiedat:DateTime;
    verifiedby:String(5);
}
type audit_aspect:managed {
    audit : String(10);
    auditat: DateTime;
    verifiedby: String(10);
    verifiedat: DateTime;
    approvedby: String(10);
    approvedat: DateTime;
}
 


//........................................................................................................
//--------------------------------------------------------------------------------------------------------- 

@Core.Description : 'Vendor Master Table'

//Vendor Master table
entity vendormaster : primary {

    @core.@title:'Vendor ID'
    @description : 'vendor ID'
    @Common.Label: 'Vendor ID'
    @Core.AutoExpand : true

    key vm_id : UUID not null;
    vm_code :String(10) not null;
    vm_firstname :String(10) default 'john';
    vm_lastname : String(10) default 'vick';
    vm_name : String=vm_firstname +' '+ vm_lastname;
    vm_address:addresses;
    vm_gstno:String(15) not null;
    vm_person:String(10);
    vm_email:String(15);
    vm_payment:String(6) default '30Days';
    is_Active:String(1) not null default 'Inactive';

    to_invoice:Composition of many inv_header on to_invoice.inv_header_number =vm_id;
    to_poheader:Composition of many poheader on to_poheader.po_vm_id = vm_id;
}

//Material Master Table

entity mastermaterial :primary {
    key mm_id :UUID not null;
    mm_code:String(10) not null;
    mm_description:String(25);
    mm_types:material_type;
    mm_stdprice:Integer;
    mmyom:uom;
    mm_gstno:String(15) not null;
    is_Active:String(1) not null default 'Inactive';
    
    to_poitems:Composition of many poitems on to_poitems.po_mm_id=mm_id;

}

//Purchase order Header
entity poheader{
    key po_id :UUID not null;
    key po_vm_id: vendormaster:vm_id;
    po_number:Integer not null ;
    //vendor : Association to vendormaster vendor.;
    vendor :vendormaster:vm_code;
    po_coco:String(5) not null default 'N/A';
    po_org:String(4) not null default 'N/A';
    po_curr:currency;
    po_doc_date: Date;
    po_delivery_date: DateTime;
    po_payment_terms: payment_terms;
    po_toatl_value:Integer; //using side effect logic we will update on run time
    po_status:status default #draft;
    po_remarks:String(255);
    //solution 01 for aspect
 
    // po_approvedby : DateTime;
    // po_approvedat: String(5) default 'BTP APPROVED';
 
    //solution 02 for aspect
    po_approved : approved_aspect;
    to_po_items:Composition of many poitems on to_po_items.po_id = po_id;
    //Association back
    to_vendormaster: Association to one vendormaster on to_vendormaster.vm_id=po_vm_id;
    
}

entity poitems: primary{
    key po_id: poheader:po_id;
    key po_mm_id: mastermaterial:mm_id;
    key po_item_id : UUID not null;
    po_lineitem_number : Integer;
    po_item_materials: mastermaterial:mm_code default 'N/A';
    po_item_materialdesc:mastermaterial:mm_description default 'N/A';
    po_item_quan:Quantity;
    po_item_uom:uom;
    po_item_netprice:Integer;
    po_item_discount : Integer default 0;   
    po_item_gst : Integer;
    // @virtual
    // po_item_discount_text : String(10) = concat(po_item_discount, '%');   // returns "10%"
    po_item_netprice_value : Decimal = (po_item_quan.order_quan * po_item_netprice) - po_item_discount;
    po_item_recevied_qty:Integer default 0;
    po_item_open_quan:Integer default 0;
    po_item_Status: report_status default #open;

    to_gritem:Composition of many gr_items on to_gritem.gr_item_poitem = po_item_id;
    to_invoice:Composition of many inv_items on to_invoice.inv_item_poitem=po_item_id;

    //association back to materialmaster
    to_matmaster: Association to one mastermaterial on to_matmaster.mm_id=po_mm_id;
    to_poheader:Association to one poheader on to_poheader.po_id =po_id;



}

entity gr_header :managed {
    key gr_id :UUID not null;
    gr_number:Integer default 0;
    gr_po: poheader:po_id;
    gr_date:Date;
    gr_stor_loc:String(3) default 'N/A';
    gr_status:status default #draft;
    gr_item_receivedquan:report_status;
    to_gritem:Composition of many gr_items on to_gritem.gr_item_ref_id=gr_number;

}

entity gr_items : managed {
    key gr_item_id : UUID not null;
    gr_item_ref_id:gr_header:gr_id;
    gr_item_poitem:poitems:po_item_id;
    gr_item_uom:uom;
    gr_item_batchno:Integer default 0;
    gr_item_remarks:String(255);
    to_poitem:Association to one poitems on to_poitem.po_item_id=gr_item_poitem;
    to_grheader:Association to one gr_header on to_grheader.gr_number=gr_item_ref_id;
}

entity inv_header : primary {
    key inv_header_id:UUID not null;
    key inv_header_number:vendormaster:vm_code;
    inv_header_vendor:vendormaster:vm_code;
    inv_header_refpo:poheader:po_number;
    inv_header_gr:gr_header:gr_number;
    inv_header_date:Date;
    inv_header_postdate:Date;
    inv_header_cuky:currency;
    inv_header_totalamt_before:Integer;
    inv_header_status:status;
    inv_header_taxamt:Integer;
    inv_header_totalamt:Integer;
    inv_header_reason_rejection:String(255);
    inv_headeraspect:post_aspect;
    to_invitems:Composition of many inv_items on to_invitems.inv_item_header=inv_header_number;


    //back association
    to_vendor:Association to one vendormaster on to_vendor.vm_id = inv_header_number;

}

entity inv_items: primary{
 
    inv_item_id: UUID not null;
    inv_item_header: inv_header: inv_header_id;
    inv_item_poitem: poitems : po_id;        
    inv_item_gr_item          : gr_items:gr_item_id;
    inv_item_quantity         : Integer default 0;
    inv_item_uom              : uom;
 
    inv_item_net_price        : poitems: po_item_netprice;
    inv_item_discount: poitems: po_item_discount;
    inv_item_gst: poitems: po_item_gst;
    inv_item_netamt     : Integer default 1;
    inv_item_totalamt     : Integer default 1;  
    inv_item_taxamt     : Integer default 1;
//back association
to_poitems:Association to one poitems on to_poitems.po_item_id=inv_item_poitem;
to_invheader:Association to many inv_header on to_invheader.inv_header_id=inv_item_header;


}
entity audit: primary{
    key error_id : UUID not null ;
    error_status : String(10) default 404;
    audit_status: String(10) default 'UnChanged';
    audit_log: audit_aspect;
}