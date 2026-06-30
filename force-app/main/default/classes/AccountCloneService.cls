public class AccountCloneService {
 
    public static void cloneAccountsWithContacts(Set<Id> accountIds){
        
        if(accountIds == null || accountIds.isEmpty()){
            return;
        }
        List<Account> oldAccounts = [SELECT Id, Name, Industry,Phone
                                   FROM Account WHERE Id IN :accountIds];
       
        List<Account> newAccounts = new List<Account>();
         Map<Id,Id> oldToNewAccountMap = new Map<Id,Id>();
        
        for(Account acc : oldAccounts){
            Account clonedAcc = new Account();
                 clonedAcc.Name = acc.Name;
                 clonedAcc.Phone = acc.Phone;
                clonedAcc.Industry = acc.Industry;
            newAccounts.add(clonedAcc);
        }
        insert newAccounts;
        
        for(Integer i = 0; i < oldAccounts.size(); i++){
            oldToNewAccountMap.put(oldAccounts[i].Id,newAccounts[i].Id);
             }
        List<Contact> oldContacts = [SELECT FirstName, LastName, Email, AccountId
                                     FROM Contact WHERE AccountId IN :accountIds];
        
        List<Contact> newContacts = new List<Contact>();
        
        for(Contact con : oldContacts){
            Contact clonedCon = new contact();
            clonedCon.FirstName = con.FirstName;
            clonedCon.LastName = con.LastName;
            clonedCon.Email = 'clone_'+con.Email;
            clonedCon.AccountId = oldToNewAccountMap.get(con.AccountId);
            
            newContacts.add(clonedCon);
        }
        
        insert newContacts;
    }
}