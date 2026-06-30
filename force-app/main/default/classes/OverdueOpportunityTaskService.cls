public class OverdueOpportunityTaskService {

    public static void createFollowupTasksForOverdueOpps(Set<Id> oppIds){
        if(oppIds == null || oppIds.isEmpty()){
            return;
        }
        List<Opportunity> lstOpp = [SELECT Id, Name, StageName, CloseDate, OwnerId FROM Opportunity
                                   WHERE Id IN :oppIds AND CloseDate < TODAY AND 
                                   StageName NOT IN ('Closed Won','Closed Lost')];
        
        List<Task> lstTsk = new List<Task>();
        for(Opportunity opp : lstOpp){
            Task ts = new Task();
            ts.Subject = 'Follow up on overdue opportunity: ' + opp.Name;
            ts.OwnerId = opp.OwnerId;
            ts.WhatId = opp.Id;
            lstTsk.add(ts);
        }
        if(!lstTsk.isEmpty()){
            insert lstTsk;
        }           
        
    }
}