public with sharing class ContactCreationController {

    @AuraEnabled(cacheable=true)
    public static List<Id> getFilteredAccountIds(String leadSource) {
       List<AggregateResult> accountAgg = [SELECT AccountId FROM Opportunity WHERE Account.AccountSource=:leadSource
                                         AND Account.Actives__c = true GROUP BY AccountId HAVING Count(Id)>2];

                 List<Id> filteredIds = new List<Id>();
                 for(AggregateResult arr : accountAgg){
                      Id accId = (Id) arr.get('AccountId');
                      filteredIds.add(accId);
                 }
                 return filteredIds;

    }
}