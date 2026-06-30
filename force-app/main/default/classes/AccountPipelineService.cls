public class AccountPipelineService {
        
    public class AccountPipelineInfo{
        public Id accountId;
        public String accountName;
        public Decimal totalOpenAmount;
    }
        public static List<AccountPipelineInfo> getAccountPipelineInfo(Set<Id> accountIds){
            
       List<AccountPipelineInfo> result = new List<AccountPipelineInfo>();
            
            if(accountIds == null || accountIds.isEmpty()){
                return result;
            }
            Map<Id,Account> accountMap = new Map<Id,Account>(
                [SELECT Id, Name FROM Account WHERE Id IN :accountIds] ); 
            
            Map<Id,Decimal> accountToAmountMap = new Map<Id,Decimal>();
              
        List<Opportunity> opps = [SELECT AccountId, Amount FROM Opportunity WHERE AccountId IN :accountIds AND 
                                           StageName NOT IN ('Closed Won','Closed Lost')];
            
            for(Opportunity opp : opps){
                
                 if(!accountToAmountMap.containsKey(opp.AccountId)){
                    accountToAmountMap.put(opp.AccountId,0);
                 }
                 
             accountToAmountMap.put(opp.AccountId,accountToAmountMap.get(opp.AccountId) + opp.Amount);
          } 
            
            for(Id accId : accountMap.KeySet()){
                AccountPipelineInfo info = new AccountPipeLineInfo();
                info.AccountId = accId;
                info.AccountName = accountMap.get(accId).Name;
              
                if(accountToAmountMap.containsKey(accId)){
                    info.totalOpenAmount=accountToAmountMap.get(accId); 
                        } else {
                            info.totalOpenAmount = 0;
                        }
           // info.totalOpenAmount = accountToAmountMap.containsKey(accId) ? accountToAmountMap.get(accId) : 0;
            
              result.add(info);
             
            }
              return result;
        }
    }