@ RestResource (urlMapping='/createData/v1')
global with sharing class RESTWebservice {

    // Post method
    @HttpPost 
    global static void pushData () {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String jSONRequestBody = request.requestBody.toString ().trim ();

        JSONParser jsnPrsr = JSONParser.parse (jSONRequestBody);
        createRecords (jsnPrsr.accounts);
    }

    private static void createRecords (List<JSONParser.Acct> pAccList) {
        List<Account> accListToInsert = new List<Account> ();
        List<Opportunity> opptyListToInsert = new List<Opportunity> ();
        for (JSONParser.Acct aAcc : pAccList) {
            Account acc = new Account ();
            //[----- your code goes here !!]

            // Using to define relationship on Opportunity
            Account referenceAcc = new Account (
                    CompositeKey__c = aAcc.acckey);

            // Child data
            for (JSONParser.Oppty oppty : aAcc.opportunities) {
                Opportunity opp = new Opportunity ();
                //[------ Your code goes here !!]

                opp.Account = referenceAcc;
                opptyListToInsert.add (opp);
            }// End for
            accListToInsert.add (acc);

        } // End for

        // DMLs
        if (accListToInsert.size () > 0) {
            Database.upsert( accListToInsert,
                        Account.CompositeKey__c.getDescribe().getSObjectField(),
                            true);
        }
        if (opptyListToInsert.size () > 0) {
            Database.upsert( opptyListToInsert,
                    Opportunity.CompositeKey__c.getDescribe().getSObjectField(),
                            true);
        }
    }
}