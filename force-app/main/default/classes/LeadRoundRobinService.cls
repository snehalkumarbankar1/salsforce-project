public class LeadRoundRobinService {

    public static void assignOwnersRoundRobin(List<Lead> leads, Id user1, Id user2){
        
        if(leads == null && leads.isEmpty()){
            return;
        }
        Integer i = 0 ;
        for(Lead ld : leads){
            if(Math.Mod(i,2) == 0){
                ld.OwnerId = user1;
            }
            else{
                ld.OwnerId = user2;
            }
            i++;
        }
    }    
}