using business from '../db/schema';

service trackorder {

    entity BSpartners as projection on business.BSpartners;

  //   @UI.HeaderInfo : {
  //       $Type : 'UI.HeaderInfoType',
  //       TypeName : '{i18n>SalesOrder}',
  //       TypeNamePlural : '{i18n>SalesOrders}',
  //       Title : { Value : SOID },
  //       Description : { Value : to_BP.BPName }
  //   }
  //    @UI.LineItem: [
  //   { Value: SOID, Label: 'SO ID' },
  //   { Value: to_BP.BPName, Label: 'Business Partner' }
  //    ]
  //    // Object Page: show fields from BOTH SalesOrders and BusinessPartners
  // @UI.Identification: [
  //   // Sales Order fields
  //   { Value: SOID,      Label: 'SO ID' },
  //   { Value: SODate,    Label: '{i18n>Order_Date}' },
  //   { Value: NetAmount, Label: '{i18n>Net_Amount}' },
  //   { Value: Currency,  Label: '{i18n>Currency}' },
  //   { Value: Status,    Label: '{i18n>Status}' },

  //   // Business Partner fields via the association path
  //   { Value: BPID,            Label: 'BP ID' },
  //   { Value: to_BP.BPName,    Label: '{i18n>BP_Name}' },
  //   { Value: to_BP.Country,   Label: '{i18n>BP_Country}' },
  //   { Value: to_BP.City,      Label: '{i18n>BP_City' }
   
   
  // ]
  // @UI.Facets: [
  //   { $Type: 'UI.ReferenceFacet', Label: 'General', Target: '@UI.LineItem' },cd 
  //   { $Type: 'UI.ReferenceFacet', Label: 'General', Target: '@UI.Identification' }
  // ]
  // @UI.SelectionFields:[ SOID, BPID, SODate, Status ]
    entity Salesorder as projection on business.Salesorder;
}
