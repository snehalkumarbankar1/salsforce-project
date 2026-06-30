public class OpportunityTriggerHandler {
    
    public static void beforeUpdate(List<Opportunity> lstOpp ,Map<Id,Opportunity> oldOppMap){
        
        for(Opportunity newOpp : lstOpp){
            if(oldOppMap.get(newOpp.Id).stageName != newOpp.stageName){
                newOpp.Amount = newOpp.Probability * newOpp.ExpectedRevenue;
            }
        }
    }
         
         
    public static void afterUpdate(List<Opportunity> oppList){
        
        if(!oppList.isEmpty()){
        for(Opportunity opp : oppList){
            if(opp.stageName == 'closed Won'){
                
            }
        }
        }
        
        
         List<Task> taskToList = new List<Task>();
        
        Set<Id>OppIds = new Set<Id>();
        list<opportunityTeamMember> deletememberlst = new list<opportunityTeamMember>();
        for(opportunity opp : oppList){
            oppIds.add(opp.id);
        }
        list<opportunityTeamMember>lstMembers = [Select id, opportunityId From OpportunityTeamMember
                                               Where opportunityId IN : OppIds];
        
        for(Opportunity opp : oppList){
            
            if(opp.StageName == 'Closed Won'){
                
                Task ts = new Task();
                ts.ownerId = opp.ownerId;
                ts.Subject = 'split';
                ts.WhatId = opp.Id;
                ts.Priority = 'High';
                ts.Description = 'please split the revenue amongst the team member';
                ts.Status = 'not started';
                
                taskToList.add(ts);
            }
            else if(opp.StageName == 'Closed Lost'){
                for(opportunityTeamMember teamMember : lstMembers){
                    if(teamMember.opportunityId == opp.id){
                        deletememberlst.add(teamMember);
                    }
                }
                
            }
        }
        if(!taskToList.isEmpty()){
            insert taskToList;
        }
            if(!deleteMemberlst.isEmpty()){
                delete deleteMemberlst;
            }
        }
    

    public static void afterDelete(list<Opportunity> lstOpps){
        map<Id,Id>oppToAccMap = new Map<Id,Id>();
        Set<Id>accIds = new Set<Id>();
        for(opportunity opp : lstOpps){
            if(opp.AccountId != null){
                accIds.add(opp.AccountId);
                oppToAccMap.put(opp.Id,opp.AccountId);
            }
        }
        if(accIds.isEmpty()){
            return;
        }
        List<Account> lstAcc = [Select id, ownerId From Account where id IN :accIds];
        
        map<Id,Id>accToOwnerMap = new Map<Id,Id>();
       
        for(Account acc : lstAcc){
            accToOwnerMap.put(acc.Id,acc.OwnerId);
        }
         List<Task>lstTask = new List<Task>();
        
            for(Opportunity opp : lstOpps){
               Id accId = oppToAccMap.get(opp.Id);
                
                if (accId != null && accToOwnerMap.containsKey(accId)) {
                    
                 Task ts = new Task();
                
            ts.Description = 'please check why opportunity is deleted';
            ts.Status = 'Not started';
            ts.OwnerId = accToOwnerMap.get(accId);
            ts.Subject = 'follow up';
            ts.WhatId = accId;
                    
                lstTask.add(ts); 
        }
      }
        if(!lstTask.isEmpty()){
            insert lstTask;
        }
    }
}