namespace ust.vinod.sabavat.db.reuse;
using { cuid,Currency } from '@sap/cds/common';
using ust.common from './common';



entity employee{
   key ID:UUID;
    nameFirst:String(40);
    nameMiddle:String(40);
    nameLast:String(40);
    nameInitials:String(40);
    Gender:String;
    Language:String(1);
    phoneNumber:String(30);
    Email:String(255);
    loginName:String(12);
    Currency: Currency;
    salaryAmount:Decimal(10, 2);
    accountNumber:String(16);
    bankId:String(8);
    bankName:String(64);




}