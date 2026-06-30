trigger AMLCaseTrigger on Opportunity (after insert) {

    if(Trigger.isInsert && trigger.isAfter){    
    
      AMLCaseHandler.afterInsert(Trigger.new);
    }
}