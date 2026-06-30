public class AccountOwnerHandler {

    public static void beforeInsert(List<Account>accs){
        if(accs == null || accs.isEmpty()){
            return;
        }
         Set<Id>OwnerIds = new Set<Id>();
        for(Account acc : accs){
            if(acc.OwnerId != null){
           OwnerIds.add(acc.OwnerId);  
            }
        }
       Map<Id,User> users = new Map<Id,User>([SELECT Name FROM User WHERE Id IN: OwnerIds]);
        for(Account acc : accs){  
            if(acc.ownerId != null){
             User us = users.get(acc.ownerId);
            if(us != null){
            acc.Sales_Rep__c = us.Name;
                }
            }
        }
    }
}