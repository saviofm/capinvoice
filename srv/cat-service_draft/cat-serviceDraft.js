const cds = require('@sap/cds');
const xsenv = require("@sap/xsenv");
//const { workflowPOST, serviceCall } = require("../common/destination-service")

class CatalogServiceDraft extends cds.ApplicationService {
    init() {
        
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
        // INIT - Instanciando                                                              //
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//

        xsenv.loadEnv();
        

        return super.init();
    }
}

module.exports = { CatalogServiceDraft };