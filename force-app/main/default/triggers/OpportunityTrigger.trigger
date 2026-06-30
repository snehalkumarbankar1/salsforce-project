trigger OpportunityTrigger on Opportunity (before insert,before update, after update,after delete) {
    
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        CreditScoreUtil.validateOpportunities(Trigger.new);
    }
    if(Trigger.IsBefore && Trigger.IsUpdate){
         OpportunityTriggerHandler.beforeUpdate(Trigger.New , Trigger.oldMap);
    }
    
    if(Trigger.IsAfter && Trigger.IsUpdate){
        OpportunityTriggerHandler.afterUpdate(Trigger.New);  
    }
    
    if(Trigger.isAfter && Trigger.IsDelete){
        OpportunityTriggerHandler.afterDelete(Trigger.Old);
    }
    if(Trigger.isBefore && Trigger.isInsert){
         LoanThresholdHandler.validate(Trigger.new);
    }
}