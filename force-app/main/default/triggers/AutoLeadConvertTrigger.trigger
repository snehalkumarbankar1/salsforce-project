trigger AutoLeadConvertTrigger on Lead (after update) {

    if(Trigger.IsUpdate && Trigger.IsAfter){
        
        AutoLeadConvertTriggerHandler.AfterUpdate(Trigger.New); 
    }
}