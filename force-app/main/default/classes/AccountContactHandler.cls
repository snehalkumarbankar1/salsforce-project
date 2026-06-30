public class AccountContactHandler {

    public static void afterInsert(List <Account> accs){
        list<Contact> lstContacts = new list<contact>(); 
        for(Account acc : accs){
            if(acc.Create_N_Contacts__c != null){
                for(integer i=0 ;i < acc.Create_N_Contacts__c; i++){
                Contact con = new Contact();
                con.lastName = acc.name + i;
                con.AccountId = acc.Id;
                    lstContacts.add(con);
              }
            }
        }
        if(!lstContacts.isEmpty()){
            insert lstContacts;
        }
    }
         
}