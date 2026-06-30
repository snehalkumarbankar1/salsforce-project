public class ContactMergeService {

    public static void mergeByEmail(String email){
        
        if(String.isBlank(email)){
            return;
        }
         List<contact> contacts = [SELECT Id,FirstName, LastName, Email, CreatedDate FROM Contact
                                 WHERE Email = :email ORDER BY CreatedDate];
                                     
        if(contacts.size()<=1){
            return;
        }  
        Contact primaryContact = contacts[0];
        
        list<Contact> contactsToDelete = new list<contact>();
        
        for(Integer i = 1 ; i < contacts.size() ; i++){
            contactsToDelete.add(contacts[i]);
        }
        if(!contactsToDelete.isEmpty()){
            delete contactsToDelete;
        }
        for(contact c : contactsToDelete){
            System.debug('deleted contacts Id: '+ c.FirstName);
        }
    }
}