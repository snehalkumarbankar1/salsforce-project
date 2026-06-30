Global class AccountBatchTotalAnnualRevenue implements Database.Batchable<SObject>,Database.stateful {
    
	Global Decimal totalAnnualRevenue = 0.0;
    
    Global Database.QueryLocator Start(Database.BatchableContext bContext){
        
    String accountQuery = 'SELECT Id, Name, AnnualRevenue,Phone,Fax, Active__c FROM Account WHERE AnnualRevenue != Null';
        return Database.getQueryLocator(accountQuery);
     }
    Global void Execute(Database.BatchableContext bContext, List<SObject> batchRecords){
       
        if(!batchRecords.isEmpty()){
            for(SObject obj : batchRecords){
               Account acc = (Account) obj;
               totalAnnualRevenue += acc.AnnualRevenue;
            }
        }
    }
    Global void Finish(Database.BatchableContext bContext){
        system.debug('get batch account id'+ bContext.getJobId());
        
        AsyncApexJob jobDetails = [SELECT Id, Status,totalJobItems,jobItemsProcessed,numberOfErrors,
                       createdBy.Email FROM AsyncApexJob WHERE Id =:bContext.getJobId()];
    }
}