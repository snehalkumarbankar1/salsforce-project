trigger ContactValidationTrigger on Contact (before insert, before update,after insert,after update ) {
    
    if(Trigger.IsBefore && Trigger.IsInsert){
        ContactValidationTriggerHandler.beforeInsert(Trigger.new);
    }
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        ContactValidationTriggerHandler.createNLocations(Trigger.New,Trigger.OldMap);
    }

    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Contact conRecord : Trigger.New){
            if(conRecord.Title == null || conRecord.Title ==''){
                conRecord.Title.AddError('please enter designation value');
            }
            if(conRecord.Phone == null || conRecord.Phone ==''){
                conRecord.Phone.AddError('please enter Phone value');
            }
            if(conRecord.Email == null || conRecord.Email ==''){
                conRecord.Email.AddError('please enter Email value');
            }
        }
    }
}