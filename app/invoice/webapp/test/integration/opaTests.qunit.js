sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'capinvoice/app/invoice/test/integration/FirstJourney',
		'capinvoice/app/invoice/test/integration/pages/InvoiceDraftList',
		'capinvoice/app/invoice/test/integration/pages/InvoiceDraftObjectPage'
    ],
    function(JourneyRunner, opaJourney, InvoiceDraftList, InvoiceDraftObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('capinvoice/app/invoice') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheInvoiceDraftList: InvoiceDraftList,
					onTheInvoiceDraftObjectPage: InvoiceDraftObjectPage
                }
            },
            opaJourney.run
        );
    }
);