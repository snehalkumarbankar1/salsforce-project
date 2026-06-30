public class LeadValidationTrigger {

    public static void afterInsert(List<Lead> lstLeads){
        
        List<Task> lstTasks = new List<Task>();
        
        for(Lead ld : lstLeads){
            Task ts = new Task();
            ts.ownerId = ld.OwnerId;
            ts.WhoId = ld.Id;
            ts.Description = 'followup with customer';
            ts.Subject = 'new lead';
            ts.Status = 'not started';
            ts.Priority = 'high';
            
            lstTasks.add(ts);
        }
        if(!lstTasks.isEmpty()){
            insert lstTasks;
        }
    }
}