public class OpportunityProbabilityService {
    
    public static void applyStageBasedProbability(Set<Id> oppIds){
        
        if(oppIds == null || oppIds.isEmpty()){
            return;
        }
        Map<String, Integer>stageToProbabilityMap = new Map<String, Integer>{
                                             'Prospecting'    => 10,
                                             'Qualification'  => 20,
                                             'Closed Won'     => 100
                                        };
                   
         List<Opportunity>oppsToUpdate = [SELECT Id, StageName, Probability FROM Opportunity
                                    WHERE Id IN: oppIds];
        
        for(Opportunity opp : oppsToUpdate){
            if(stageToProbabilityMap.containsKey(opp.StageName)){
                opp.Probability = stageToProbabilityMap.get(opp.StageName);
            }
        }
        if(!oppsToUpdate.isEmpty()){
            update oppsToUpdate;
        }
    }

}