public with sharing class CaseClientController {
    @AuraEnabled(cacheable=true)
    public static Client__c getClientDetails(Id clientId){
        return [SELECT Id, Name, Email__c,Phone__c,Address__c FROM Client__c WHERE Id=: clientId LIMIT 1];
    }
}