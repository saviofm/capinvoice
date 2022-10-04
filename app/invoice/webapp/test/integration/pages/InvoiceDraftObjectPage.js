sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'capinvoice.app.invoice',
            componentId: 'InvoiceDraftObjectPage',
            entitySet: 'InvoiceDraft'
        },
        CustomPageDefinitions
    );
});