public class accountUpdateConWeb {
	
    public static void afterUpdate(List<Account> lstAcc ,Map<Id,Account> oldMap){
        
        Map<Id,String> webMap = new Map<Id,String>();
        
        for(Account newAcc: lstAcc){
            if(newAcc.website != oldMAp.get(newAcc.Id).website){
                webMap.put(newAcc.Id,newAcc.website);
            }
        }
        
        if(!webMap.isEmpty()){
                list<Contact>lstCon = [Select Id, lastName, AccountId,Website__c From Contact
                                Where AccountId IN : webMap.keySet()];
        
        
        if(!lstCon.isEmpty()){
            List<Contact> lstContacts = new List<Contact>();
           for(Contact con : lstCon){
            
            con.website__c = webMap.get(con.accountId);
            lstContacts.add(con);
        }
        if(!lstContacts.isEmpty()){
            update lstContacts;
        }
        }
        }
    }
}