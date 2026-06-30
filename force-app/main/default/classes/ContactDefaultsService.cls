public class ContactDefaultsService {
    public static void applyDefaultPhoneFromAccount(List<Contact> contacts){
        if(contacts == null || contacts.IsEmpty()){
            return;
        }
        Set<Id>AccountIds = new set<Id>();
        for(contact con : contacts){
                    if(con.Phone == null && con.AccountId !=null){
                        AccountIds.add(con.AccountId);
                    }
            
                }
        if(AccountIds.isEmpty()){
            return;
        }
    Map<Id,Account>mapAccount = new Map<Id,Account>([SELECT Id,Phone FROM Account WHERE Id IN:AccountIds]);
        
        for(contact con : contacts){
            
            if(con.Phone == null && con.AccountId != null &&
                mapAccount.containsKey(con.AccountId)&&
               mapAccount.get(con.AccountId).Phone != null){
                   
               con.Phone =  mapAccount.get(con.AccountId).Phone ;
        }
     }
        
        }
    }