public class ContactValidationTriggerHandler {
	
    public static Void createNLocations(list<Contact> newRecords,Map<Id,Contact>oldMap){
        
        List<Location__c> locationsToInsert = new List<Location__c>();
        List<Location__c> locationsToDelete = new List<Location__c>();
        
        Map<Id,List<Location__c>>contactLocationMap = new  Map<Id,List<Location__c>>();
        if(oldMap != null){
            for(Location__c loc : [
                SELECT Id, Contact__c
                FROM Location__c
                WHERE Contact__c IN :oldMap.keySet()
            ]){

                if(!contactLocationMap.containsKey(loc.Contact__c)){
                    contactLocationMap.put(loc.Contact__c, new List<Location__c>());
                }

                contactLocationMap.get(loc.Contact__c).add(loc);
            }
        }

        for(Contact con : newRecords){

            Integer newValue = con.Create_N_Locations__c == null ? 0 : Integer.valueOf(con.Create_N_Locations__c);
            Integer oldValue = 0;

            if(oldMap != null && oldMap.containsKey(con.Id)){
                oldValue = oldMap.get(con.Id).Create_N_Locations__c == null
                           ? 0
                           : Integer.valueOf(oldMap.get(con.Id).Create_N_Locations__c);
            }

            if(newValue > oldValue){

                Integer toCreate = newValue - oldValue;

                for(Integer i = 0; i < toCreate; i++){
                    locationsToInsert.add(
                        new Location__c(
                            Name = 'Location ' + i,
                            Contact__c = con.Id
                        )
                    );
                }

            } else if(newValue < oldValue){

                Integer toDelete = oldValue - newValue;

                if(contactLocationMap.containsKey(con.Id)){

                    List<Location__c> existing = contactLocationMap.get(con.Id);

                    for(Integer i = 0; i < toDelete && i < existing.size(); i++){
                        locationsToDelete.add(existing[i]);
                    }
                }
            }
        }

        if(!locationsToInsert.isEmpty()){
            insert locationsToInsert;
        }

        if(!locationsToDelete.isEmpty()){
            delete locationsToDelete;
        }
    }

       
    public static Void beforeInsert(list<Contact> lstContacts){
        
        for(Contact con : lstContacts){
            if(con.AccountId == null){
                con.AccountId.addError('when create a contact parent is required to create');
            }  
        }
        Set<Id> accIds = new Set<Id>();
        for(Contact con : lstContacts){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
   Map<Id,Account> accToConMap = new Map<Id,Account>([SELECT Id, Name, MaxContactsAllowed__c,
                                                     (Select Id,LastName from contacts) FROM Account 
                                                           WHERE Id IN : accIds]);
        for(Id accId : accToConMap.keyset()){
           Integer numberOfContactPerAccount = (accToConMap.get(accId).contacts).size();
            if(accToConMap.get(accId).MaxContactsAllowed__c < numberOfContactPerAccount ){
                for(Contact con : lstContacts){
                    con.addError('max contacts are not allowed please check account field MaxContactsAllowed');
                }
            }
        }
        
    }
}