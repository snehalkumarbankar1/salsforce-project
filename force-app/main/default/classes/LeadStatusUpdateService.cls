public class LeadStatusUpdateService {
    public static void updateHotLeadsStatus(Set<Id> leadIds){
        if(leadIds == null || leadIds.isEmpty()){
            return;
        }
        List<Lead> lstLd = [SELECT Id, Status, Rating FROM Lead
                            WHERE Id IN :leadIds AND Rating = 'Hot'];
        if(!lstLd.isEmpty()){
            for(Lead ld : lstLd){
                ld.Status= 'Working - Contacted';
            }  
            update lstLd;
        }
    }
}