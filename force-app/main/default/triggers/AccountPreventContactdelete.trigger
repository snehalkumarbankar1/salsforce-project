trigger AccountPreventContactdelete on Account (before delete,after update) {
    
    if(Trigger.IsAfter && Trigger.IsUpdate) {
        accountUpdateConWeb.afterUpdate(Trigger.New ,Trigger.oldMap);
    }
    
    
    
    if(Trigger.IsBefore && Trigger.IsDelete){
        
        List<Contact> lstContacts = [SELECT Id , FirstName, LastName, AccountId FROM Contact
                                      WHERE AccountId IN : Trigger.OldMap.Keyset()];
        
        if(!lstContacts.isEmpty()){
            
            for(Contact con : lstContacts){
                
                con.AccountId = 'null';
                
            }
            update lstContacts;
        }
    }
}