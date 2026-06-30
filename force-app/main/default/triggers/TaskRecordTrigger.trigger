trigger TaskRecordTrigger on Task (before update) {
    
    if(Trigger.IsBefore && Trigger.IsUpdate){
      TaskRecordHelper.beforeUpdate(Trigger.new);
    }
}