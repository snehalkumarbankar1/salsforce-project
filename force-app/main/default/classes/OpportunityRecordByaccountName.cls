@RestResource(URLMapping='/OpportunityRecords/*')
Global class OpportunityRecordByaccountName {
    @HttpGet()
    Global static List<Opportunity> getOpportunityByAccName(){
        Map<String,String> inputParams = RestContext.request.params;
        List<Opportunity> lstOpp = [SELECT Id,Name,StageName FROM Opportunity
                                    WHERE Account.Name =: inputParams.Get('accName')];
        return lstOpp;
    }
}