trigger PreventDuplicateHRTrigger on Hiring_Manager__c (before insert) {

    if(Trigger.IsInsert && Trigger.IsBefore){
        
        for(Hiring_Manager__c hrRecord : Trigger.New){
            
         Integer recordsCount  =  [SELECT Count() FROM Hiring_Manager__c 
                                     WHERE Name =: hrrEcord.Name
                                     AND Contact_Number__c =: hrRecord.Contact_Number__c
                                     AND Email_Id__c =: hrRecord.Email_Id__c];
            if(recordsCount>0){
                hrRecord.AddError('Duplicate record found with same details, hence recordcannot be inserted');
            }
        }
    }
}