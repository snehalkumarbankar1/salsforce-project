public class ContactGroupingService {
    
     public static Map<Id, List<Contact>> getContactsByAccount(Set<Id> accountIds) {

        Map<Id, List<Contact>> accToConMap = new Map<Id, List<Contact>>();

        if (accountIds == null || accountIds.isEmpty()) {
            return accToConMap;
        }

        List<Contact> contacts = [
            SELECT Id, FirstName, LastName, Email, AccountId
            FROM Contact
            WHERE AccountId IN :accountIds
            ORDER BY AccountId
        ];
        
        for (Contact con : contacts) {
		
            if (!accToConMap.containsKey(con.AccountId)) {
                accToConMap.put(con.AccountId, new List<Contact>()); 
            }

            accToConMap.get(con.AccountId).add(con); 
        }
       
        return accToConMap;
    }
}