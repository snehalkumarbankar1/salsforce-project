@RestResource(URLMapping='/upsertLeadService/*')
global class LeadUpsertUtility {
 @HttpPatch()
    Global static String upsertLead(string recordId,string company,string phone){
        List<Lead> lstLead = new List<Lead>();
        if(recordId != null && recordId != ''){
        Lead ld = [SELECT Id,Name,Company,Phone FROM Lead WHERE Id=: recordId];
          ld.Company=company;
            ld.Phone = phone;
            lstLead.add(ld);
        }
        else{
            return 'record not found';
        }
        Lead ldRec = new Lead();
        ldRec.FirstName= 'praveen';
        ldRec.LastName = 'kumar';
        ldRec.Company = 'TCS';
        ldRec.Status ='open';
        lstLead.add(ldRec);
        
        upsert lstLead;
        return 'record upsert succefully';
    }
}