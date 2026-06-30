public with sharing class TaskController {
    @AuraEnabled(cacheable=true)
    public static List<Task> fetchTaskBySub(String subjectString) {
        subjectString ='%'+subjectString+'%';
    return [SELECT Id, Subject, Status, Description FROM Task WHERE Subject LIKE :subjectString];
    }
}