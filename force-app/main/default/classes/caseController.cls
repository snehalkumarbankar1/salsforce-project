public with sharing class caseController {
    @AuraEnabled(cacheable=true)
    public static list<Case> getCaseRecord() {
    
        return [SELECT Id, CaseNumber, Subject, Status, Origin, Opportunity__c FROM Case 
        ORDER BY CreatedDate LIMIT 20];
    }
}