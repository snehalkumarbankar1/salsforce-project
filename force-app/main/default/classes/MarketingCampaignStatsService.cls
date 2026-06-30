public class MarketingCampaignStatsService {
   
    public static void updateLeadCount(Set<Id> campaignIds){
        
        if(campaignIds == null || campaignIds.isEmpty()){
            return;
        }
        Map<Id,Integer>campaignToLeadCount = new Map<Id,Integer>();
        
      List<AggregateResult> result = [SELECT Marketing_Campaign__c campaignId, COUNT(Id)totalLeads 
                                      FROM Campaign_Lead__c
                                      WHERE Marketing_Campaign__c IN :campaignIds
                                      GROUP BY Marketing_Campaign__c ];
        
        for(AggregateResult ar : result){
            Id campId = (Id) ar.get('campaignId');
            Integer leadCount = (Integer) ar.get('totalLeads');
            campaignToLeadCount.put(campId,leadCount);
        } 
            List<Marketing_Campaign__c> campaignToUpdate = new  List<Marketing_Campaign__c>();
            
            for(Id campId : campaignIds){
                Integer countValue = 0;
                if (campaignToLeadCount.containsKey(campId)) {
                   countValue = campaignToLeadCount.get(campId);
                  }
                
                Marketing_Campaign__c mc = new Marketing_Campaign__c();
                mc.Id = campId;
                mc.Lead_Count__c = countValue;
                campaignToUpdate.add(mc);
            }
             if(!campaignToUpdate.isEmpty()) {
            update campaignToUpdate;
        }
    }
}