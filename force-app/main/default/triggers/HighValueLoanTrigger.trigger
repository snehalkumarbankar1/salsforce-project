trigger HighValueLoanTrigger on Opportunity (before insert, before update) {
    
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
           HighValueLoanHandler.process(Trigger.new);
    }
}