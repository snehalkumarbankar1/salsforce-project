public class ContactEnrichmentService {
    
    public static void syncAccountFieldsToContacts(Set<Id> contactIds){
        
        if(contactIds == null || contactIds.isEmpty()){
            return;
        }
        
        List<Contact> contactsToUpdate = [SELECT Id, Account.Industry, Account.Type, AccountId FROM Contact 
                                WHERE Id IN :contactIds];
        
        for(Contact con : contactsToUpdate){
            if(con.AccountId != null){
          Con.Account_Industry__c = con.Account.Industry;
          Con.Account_Type__c =  con.Account.Type;
            }
           }
        if(!contactsToUpdate.isEmpty()){
            update contactsToUpdate;
        }
      }
        
    }