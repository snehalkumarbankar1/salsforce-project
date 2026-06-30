public class HiringManagerUtility {
      
    Public Static void InsertBulkHRRecords()
    { 
        List<Hiring_Manager__C>lstHRRecords = new List<Hiring_Manager__C>();
        For(Integer i=1;i<=200;i++)
    {
        Hiring_Manager__C hrRecords = new Hiring_Manager__C();
        
        hrRecords.Name = 'test Hr record..-'+ i;
        hrRecords.Contact_number__c = '9867557567';
        hrRecords.Designation__c = 'HR Executive';
        hrRecords.Email_ID__c = 'hr'+ i +'@gmail.com';
        hrRecords.Location_Name__c = 'mumbai';
        hrRecords.Current_CTC__c = 2400000;
        lstHRRecords.Add(hrRecords);
    }
       if(! lstHRRecords.IsEmpty())
        insert lstHRRecords;
    }
}