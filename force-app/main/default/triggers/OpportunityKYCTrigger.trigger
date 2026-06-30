trigger OpportunityKYCTrigger on Opportunity (Before Update,after update,after insert) {
    
    if(Trigger.isUpdate && Trigger.isBefore){
     OpportunityKYCHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
    }
    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert)){
        AccountRiskHandler.updateRisk(Trigger.new);
    }
}