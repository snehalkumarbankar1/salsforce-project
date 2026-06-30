public class CasePriorityValidationService {

    public class InvalidCasePriorityException extends Exception{}
    
    public static void validateCases(List<Case> cases){
        
        if(cases == null || cases.isEmpty()){
            return;
        }
        Set<Id> accId = new Set<Id>();
        
        for(case cs : cases){
            if(cs.AccountId != null){
             accId.add(cs.AccountId);
            }
        }
        
        if (accId.isEmpty()) {
            return;
        }
            Map<Id,Account> accMap = new Map<Id,Account>([SELECT Id,Type FROM Account WHERE Id IN :accId]);
            
            for(case cs : cases){
                if(cs.AccountId != null && cs.Priority =='Low'){
                    Account acc = accMap.get(cs.AccountId);
               
                if(acc !=null && acc.Type == 'Premium'){
                    throw new InvalidCasePriorityException('Premium account cases cannot have Low priority');
            }
         }
       }
     } 
  }