public class LeadValidationInsertService {
           
    public static void insertValidLeads(List<Lead> leads){
        
        if(leads == null || leads.isEmpty()){
            return;
        }
        
        List<Lead>lstLead = new List<Lead>();
        
        for(Lead ld : leads){
            
            if(ld.Company != null && ld.Email != null){
                lstLead.add(ld);
            }   
            Else{
                   System.debug('company and Email are mandatory fields this record not inserted'+ ld);
            }
        }
        if(!lstLead.isEmpty()){
            insert lstLead;
        }
      }
}