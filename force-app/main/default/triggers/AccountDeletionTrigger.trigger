trigger AccountDeletionTrigger on Account (before delete, after insert) {
    
    if(Trigger.IsInsert && Trigger.IsAfter){
        
        AccountContactHandler.AfterInsert(Trigger.New);
    }

    if(Trigger.IsDelete && Trigger.IsBefore){
        for(Account accRecord : Trigger.Old){
            if(accRecord.Active__c == 'Yes' && accRecord.SLA__c == 'Gold'){
                accRecord.AddError('you are not authorized to delete an active account record ');
            }
        }
    }
}