public class OpportunityFilterService {

    public static List<Opportunity> getFilteredOpportunities(String stage, Id ownerId, Decimal minAmount){
        
        List<Opportunity> lstOpp = new List<Opportunity>();
        if(String.isBlank(stage) || ownerId == null || minAmount == null){
            return lstOpp;
        }
        
       List<opportunity>lstOpps = [SELECT Id, StageName,OwnerId, Amount FROM Opportunity
                  WHERE StageName= : stage AND OwnerId= :ownerId AND Amount >= :minAmount];
        
      
            return lstOpps;
    }
}

/* public class OpportunityFilterService {

    public static List<Opportunity> getFilteredOpportunities(String stage, Id ownerId, Decimal minAmount){
        
        if(String.isBlank(stage) || ownerId == null || minAmount == null){
            return new List<Opportunity>();;
        }
        
      return [SELECT Id, StageName,OwnerId, Amount FROM Opportunity
                  WHERE StageName= : stage AND OwnerId= :ownerId AND Amount >= :minAmount];
        
      
    }
}    */