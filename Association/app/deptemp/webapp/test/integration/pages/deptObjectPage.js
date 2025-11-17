sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.assoc.deptemp',
            componentId: 'deptObjectPage',
            contextPath: '/employee/department'
        },
        CustomPageDefinitions
    );
});