public class RelatedObjectHelper
{
    Public static void candidateParentRecord(string CandidateName)
    {
        if(CandidateName != null && CandidateName != '')
        {     
            Candidate__c canRecord = [ Select Id,Name,Contact_Number__c,Email_Id__c,
                                      Position__r.Name,Position__r.Designation__c,Position__r.Location_Name__c,
                                      Position__r.Hiring_Manager__r.Name,Position__r.Hiring_Manager__r.Email_Id__c
                                     From Candidate__c Where Name =: CandidateName];
            if(canRecord.Id != Null)
            {
                system.debug('Candidate record id is..'+ canRecord.Id);
                System.debug('candidate record name is ..'+ canRecord.Name);
                System.debug('candidate record contactNumber is..'+ Canrecord.Contact_number__c);
                System.debug('Position record name is.. '+ canrecord.Position__r.name);
                System.debug('position record designation is..'+ canRecord.Position__r.Designation__c);
                system.debug('Hiring manager name is ...'+ canRecord.Position__r.Hiring_Manager__r.Name);
                System.debug('Hiring Manger record EmailId is ..'+ canRecord.Position__r.Hiring_Manager__r.Email_Id__c);
            }
       }
    }
    
    public Static Void AccountRelatedRecord(String AccRecordName)
  {
      if(AccRecordName != Null && AccRecordName != '')
    {
   Account acc = [Select Id,Name,Industry,AnnualRevenue,Phone,Rating,(Select Id,FirstName,LastName,Phone,Title,Email from Contacts),
                      (Select Id,Name,Amount,CloseDate,stageName,Type from Opportunities),
                       (Select Id,Origin,Status,caseNumber,Priority,Reason From cases) From Account where Name =: AccRecordName];
         If(acc.Id != null)
         {
             System.debug('account record is..'+ acc);
             System.debug('....................');
             
             List<Contact> lstCon = acc.contacts;
             System.debug('list of contacts are..'+ lstCon.Size());
             
             if(!lstcon.isEmpty())
             {
                  for(contact con : lstcon)
                 {
                     System.debug('list of contact records are..'+ con);
                     System.debug('-------------------------------------');
                 }
             }
              List<Opportunity> lstOpty = acc.Opportunities;
             System.debug('size of Opportunities are..' + lstOpty.Size());
             
             if(!lstOpty.isEmpty())
             {
                 for(Opportunity opty : lstOpty)
                 {
                     System.debug('Opportunity records are..'+ opty);
                     System.debug('-------------------------------------');
                 }
             }
             List<Case>lstCs = acc.cases;
             System.debug('list of cases are..'+ lstCs.Size());
             
             if(!lstCs.isEmpty())
             { 
                   for( case Cs :lstCs)
                 {
                     System.debug('case records are..'+ Cs);
                     System.debug('-------------------------------------');
                  }
             } 
         }
    }
        
        
    }    
        
        
        
   public static Void getPosRecords(String PosRecordName)
   {
       if(PosRecordName != Null && PosRecordName != '')
  {
     Position__c posRecord = [ Select Id,Name,Designation__c,Location_Name__c,Position_Status__c,(Select Id, 
                                     Name,Contact_Number__c,Email_Id__c From Candidates__r)
                                      From Position__c where Name =:PosRecordName];
           if(PosRecord.Id != Null)
           {
             System.debug(PosRecord);
               List<Candidate__c> lstcan = PosRecord.Candidates__r;
               system.debug('size of position record is'+ lstcan.Size());
               
                   For(Candidate__c can : lstcan)
                   {
                     System.debug(can); 
                   }
               
               
           }
       }
   }
}