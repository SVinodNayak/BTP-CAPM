sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/assoc/deptemp/test/integration/pages/employeeList",
	"com/assoc/deptemp/test/integration/pages/employeeObjectPage",
	"com/assoc/deptemp/test/integration/pages/deptObjectPage"
], function (JourneyRunner, employeeList, employeeObjectPage, deptObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/assoc/deptemp') + '/test/flp.html#app-preview',
        pages: {
			onTheemployeeList: employeeList,
			onTheemployeeObjectPage: employeeObjectPage,
			onThedeptObjectPage: deptObjectPage
        },
        async: true
    });

    return runner;
});

