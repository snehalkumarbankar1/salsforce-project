public class OpportunityAnalyticsService {
    public static Decimal getTotalAmountByStage(String stageName){
       
        if(string.isBlank(stageName)){
            return 0;
        }
     List<AggregateResult> results = [SELECT SUM(AMOUNT) totalAmount FROM Opportunity WHERE StageName =:stageName];
        
    
         if(!results.isEmpty() && results[0].get('totalAmount') != null)
         {
             return (Decimal) results[0].get('totalAmount');
             }
         
    return 0;
}
}