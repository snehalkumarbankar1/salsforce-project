public with sharing class IndependentWireController {

    @AuraEnabled(cacheable=true)
    public static List<Case> fetchCases() {
return [SELECT Id,Subject,Origin,Priority FROM Case LIMIT 5];
    }
     @AuraEnabled(cacheable=true)
    public static List<Task> fetchTasks(){
return [SELECT Id,Subject,Description,ActivityDate FROM Task LIMIT 5];
    }
}