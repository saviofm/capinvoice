const cds = require('@sap/cds');
const xsenv = require("@sap/xsenv");

class CatalogRest extends cds.ApplicationService {
    init() {

    
        xsenv.loadEnv();

        
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
        // Schedule - READ               //
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
        this.after('READ', 'Schedule', (each, req) => {
           
        });
        


        return super.init();
    }
}

module.exports = { CatalogRest };
