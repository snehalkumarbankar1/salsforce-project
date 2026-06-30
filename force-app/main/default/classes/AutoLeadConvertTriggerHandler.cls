public class AutoLeadConvertTriggerHandler {

    public static void AfterUpdate(List<Lead>lstLeads){
        
        LeadStatus lStatus = [SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted = True];
        
        user recordOwner = [SELECT Id,Firstname, LastName, UserName FROM user WHERE 
                            UserName =: system.label.AccountToTransfer];
        
        List<Database.LeadConvert> lstLeadsToConvert = new List<Database.LeadConvert>();
        
        for(Lead ldRecord :lstLeads){
       
            if(ldRecord.Status == 'Closed - Converted' && ldRecord.IsConverted == false){
                
                Database.LeadConvert lConvert = new database.LeadConvert();
                
                lConvert.setLeadId(ldRecord.Id);
                lConvert.setDoNotCreateOpportunity(false);
                lConvert.setSendNotificationEmail(True);
                lConvert.setConvertedStatus(lStatus.MasterLabel);
                String leadRecordOwner = ldRecord.OwnerId;
                
                if(leadRecordOwner.Startswith('00G')){
                   lConvert.setOwnerId(recordOwner.Id); 
                }
                lstLeadsToConvert.add(lConvert);
            }  
            
        }
        if(!lstLeadsToConvert.isEmpty()){
           Database.LeadConvertResult[] result = Database.convertLead(lstLeadsToConvert, False);
        }
    }
}