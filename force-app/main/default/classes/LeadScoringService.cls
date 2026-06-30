public class LeadScoringService {

    public static void recalculateLeadScores(Set<Id> leadIds){
        
        if(leadIds == null && leadIds.isEmpty()){
            return;
        }
        List<lead> updateLd = new List<Lead>();
        
        List<lead> lstLd = [SELECT Id, Name, Rating, Phone, Email, Lead_Score__c FROM Lead
                                  WHERE Id IN :leadIds];
        
        for(Lead ld : lstLd){
            ld.Lead_Score__c = calculateScore(ld);
            updateLd.add(ld);
        }
        if(!updateLd.isEmpty()){
            update updateLd;
        }
    }
    private static Integer calculateScore(Lead ld){
        
        Integer Score = 0;
        
        if(ld.Rating == 'Hot'){
            Score += 50;
        }
           else if(ld.Rating == 'warm'){
                Score += 20;
            }
                if(String.isNotBlank(ld.Phone)){
                    Score += 10;
                }
                   if(String.isNotBlank(ld.Email)){
                        Score += 10;
                    }
                    return Score;
               }
    }