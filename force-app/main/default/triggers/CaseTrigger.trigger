trigger CaseTrigger on Case (before insert) {

    if(Trigger.IsInsert && Trigger.IsBefore){
        for(Case cs : Trigger.New){
            if(cs.ContactId == null){
                cs.ContactId.AddError('this record not associated with contact');
                if(cs.AccountId == null){
                    cs.AccountId.AddError('this record not associated with account');
                }
            }
        }
    }
}