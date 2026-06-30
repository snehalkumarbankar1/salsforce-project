public class SOSLGlobal {
	
    public static void searchRecords(){
        
        List<List<SObject>> lstRecords = [FIND 'test*' IN ALL FIELDS RETURNING
                                         Account(Id,Name,Industry,AnnualRevenue,Phone,Fax,Active__c),
                                         Contact(Id,FirstName,LastName,Title,Phone,Fax,Email),
                                         Lead(Id,FirstName,LastName,Title,Phone,Fax,Email,Status),
                                         Case(Id,CaseNumber,Origin,Status,Subject,Description,Priority,Reason),
                                         Hiring_Manager__c(Id,Name,contact_Number__c,Email_Id__c,Designation__c)];
        
       List<Account> lstAccounts = (List<Account>) lstRecords.get(0);
        system.debug('size of account records is....'+ lstAccounts.Size());
        for(Account acc : lstAccounts){
            
            system.debug('account record are....'+ acc);
            
        }
         system.debug('------------------------------------');
         List<Contact> lstcontacts = (List<Contact>) lstRecords.get(1);
        system.debug('size of Contact records is....'+ lstContacts.Size());
        for(Contact con : lstContacts){
            
            system.debug('Contact record are....'+ con);
        }
         system.debug('------------------------------------');
        List<Lead> lstLeads = (List<Lead>) lstRecords.get(2);
        system.debug('size of Lead records is....'+ lstLeads.Size());
        for(Lead ld : lstLeads){
            
            system.debug('Lead record are....'+ ld);
        }
         system.debug('------------------------------------');
         List<Case> lstCases = (List<Case>) lstRecords.get(3);
        system.debug('size of Case records is....'+ lstCases.Size());
        for(Case cs : lstCases){
            
            system.debug('Case record are....'+ cs);
        }
         system.debug('------------------------------------');
        List<Hiring_Manager__c> lstHRRecs = (List<Hiring_Manager__c>) lstRecords.get(4);
        system.debug('size of HR  records is....'+ lstHRRecs.Size());
        for(Hiring_Manager__C HRRec : lstHRRecs){
            
            system.debug('Case record are....'+ HRRec);
        }
    }
}