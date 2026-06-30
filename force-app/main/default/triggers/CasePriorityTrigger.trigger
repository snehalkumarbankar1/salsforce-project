trigger CasePriorityTrigger on Case (before insert) {
    
    if(Trigger.IsInsert && Trigger.IsBefore){
        
        for(Case cs : Trigger.New){
            if(cs.Origin == 'Phone'){
                cs.Priority = 'High';
            }
            else{
                cs.Priority = 'Low';
            }
        }
    }
}