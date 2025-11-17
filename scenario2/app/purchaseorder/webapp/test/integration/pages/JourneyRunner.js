sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/assoc/purchaseorder/test/integration/pages/BusinessPartnersList",
	"com/assoc/purchaseorder/test/integration/pages/BusinessPartnersObjectPage"
], function (JourneyRunner, BusinessPartnersList, BusinessPartnersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/assoc/purchaseorder') + '/test/flp.html#app-preview',
        pages: {
			onTheBusinessPartnersList: BusinessPartnersList,
			onTheBusinessPartnersObjectPage: BusinessPartnersObjectPage
        },
        async: true
    });

    return runner;
});

