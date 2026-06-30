public class ContactSearchService {

    public static List<Contact> getContactsByEmailDomain(String domain){
       
        List <Contact>lstCon = new List<Contact>();
             if(String.isBlank(domain))
             {
                 return lstCon;
             }
        String Edomain = '%@'+domain;
        
           lstCon = [SELECT Id, FirstName, LastName, Email FROM Contact
                     WHERE Email
                     LIKE: Edomain];
        
        if(!lstCon.isEmpty())
        {
            for(contact con : lstCon){
                System.debug('-----------------------'+con);
            } 
        }
       return lstCon;   
    } 
  }