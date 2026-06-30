public class LeadTriggerHandler {

    public static Void beforeUpdate(List<Lead> lstLeads){
        for(Lead ld : lstLeads){
            if(ld.CreatedDate < system.Today()-8){
                ld.addError('you cannot modify this record');
            }
        }
    }
    public static Void beforeDelete(List<Lead> lstLeads){
        for(Lead ld : lstLeads){
            if(ld.status == 'working - contacted'){
               ld.addError('if status is working contacted you cant delete this record'); 
            }
        }
    }
}