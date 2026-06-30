public class ActiveAccountContactService {
    
    public static void insertContactsForActiveAccounts(List<Contact> contacts){
        
        if(contacts == null || contacts.isEmpty()){
            return;
        }
        
        Set<Id>accountIds = new Set<Id>();
        for(Contact con : contacts){
            if(con.AccountId != null){
            accountIds.add(con.AccountId);
        }
     }
        
        Map<Id,Account> accMap = new Map<Id,Account>([SELECT Id, Name, Active__c FROM Account
                                                     WHERE Id IN :accountIds]);
        
    List<Contact> insertCons = new List<Contact>();
        
        for(Contact con : contacts){
            Account acc = accMap.get(con.AccountId);
            
            if(acc != null && acc.Active__c == 'yes'){
                insertCons.add(con);
            } else {
                      system.debug('contact not inserted because its inactive...'+ con);
            }
        }
        if(!insertCons.isEmpty()){
        insert insertCons;
   }
      }
}