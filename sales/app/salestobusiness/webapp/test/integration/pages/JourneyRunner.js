sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/assoc/salestobusiness/test/integration/pages/SalesorderList",
	"com/assoc/salestobusiness/test/integration/pages/SalesorderObjectPage",
	"com/assoc/salestobusiness/test/integration/pages/BSpartnersObjectPage"
], function (JourneyRunner, SalesorderList, SalesorderObjectPage, BSpartnersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/assoc/salestobusiness') + '/test/flp.html#app-preview',
        pages: {
			onTheSalesorderList: SalesorderList,
			onTheSalesorderObjectPage: SalesorderObjectPage,
			onTheBSpartnersObjectPage: BSpartnersObjectPage
        },
        async: true
    });

    return runner;
});

