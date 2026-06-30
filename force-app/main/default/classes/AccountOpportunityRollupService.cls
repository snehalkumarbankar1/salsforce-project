public class AccountOpportunityRollupService {
    
    public static void updateOpportunityRollups(Set<Id> accountIds){
        if(accountIds == null || accountIds.isEmpty()){
            return;
        }
        Map<Id,Decimal> accToOpenMap = new Map<Id,Decimal>();
        Map<Id,Decimal> accToCloseMap = new Map<Id,Decimal>();
        
    List<AggregateResult> cResult = [SELECT AccountId accId, SUM(Amount) totalAmt FROM Opportunity 
                                   WHERE StageName != 'Closed Won' AND AccountId IN :accountIds GROUP BY AccountId]; 
        
        for(AggregateResult ar : cResult){
             Id accId= (Id) ar.get('accId');
            Decimal cAmount = (Decimal) ar.get('totalAmt');
            accToOpenMap.put(accId,cAmount);
        }
      List<AggregateResult> oResult = [SELECT AccountId accId, SUM(Amount) totalAmt FROM Opportunity 
                                   WHERE StageName = 'Closed Won' AND AccountId IN :accountIds GROUP BY AccountId]; 
        
        for(AggregateResult ar: oResult){
            Id accId = (Id) ar.get('accId');
            Decimal oAmount = (Decimal) ar.get('totalAmt');
            accToCloseMap.put(accId,oAmount);
        }
            List<Account> accountsToUpdate = new List<Account>();
        
        List<Account> lstAcc = [SELECT Id,Name,Total_Open_Amount__c, Total_Closed_Won_Amount__c FROM Account 
                                WHERE Id IN :accountIds];
        for(Account acc : lstAcc){
            acc.Total_Open_Amount__c = 0;
            acc.Total_Closed_Won_Amount__c = 0;
            if(accToOpenMap.containskey(acc.Id)){
                acc.Total_Open_Amount__c = accToOpenMap.get(acc.Id);
            }
            if(accToCloseMap.containsKey(acc.Id)){
                acc.Total_Closed_Won_Amount__c = accToCloseMap.get(acc.Id);
            }  
            accountsToUpdate.add(acc);
    }
        if(!accountsToUpdate.isEmpty()){
      update accountsToUpdate;  
    }
  }
}