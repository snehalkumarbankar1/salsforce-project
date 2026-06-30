trigger LeadValidationTrigger on Lead (before Update,after insert,before delete) {
    
    if(Trigger.IsBefore && Trigger.IsDelete){
        LeadTriggerHandler.beforeDelete(Trigger.Old);
    }

    if(Trigger.IsInsert && Trigger.IsAfter){
        
        LeadValidationTrigger.afterInsert(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.IsUpdate){
        LeadTriggerHandler.beforeUpdate(Trigger.New);
    }
}