Trigger AccountContactTrigger on account (after Insert,before insert){
    
    if(trigger.isInsert && trigger.isAfter){
        
         AccountContact.afterInsert(Trigger.new);
     
    }
    if(Trigger.isBefore && Trigger.isInsert){
        accountOwnerHandler.beforeInsert(Trigger.new);
    }
}