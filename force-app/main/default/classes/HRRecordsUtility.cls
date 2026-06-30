public class HRRecordsUtility {
    Public static void InsertHRRecord(String hrName , String hrCity, String hrTitle, String hrPhone, 
                               String hrType, String hrEmail ,Decimal hrSalary)
        
    {       
        if(hrName != Null && hrPhone != Null && hrEmail != Null)
        {  
            Hiring_Manager__c hrRecord = new Hiring_Manager__c();
            
            hrRecord.Name = hrName;
        hrRecord.Location_Name__c = hrcity;
        hrRecord.Designation__c = hrTitle;
        hrRecord.Contact_number__c = hrPhone;
        hrRecord.Employement_Type__c = hrType;
        hrRecord.Email_ID__c = hrEmail;
        hrRecord.Current_CTC__c = hrSalary;
        
        insert hrRecord;
        
    
    if(hrRecord.id != Null)
    
        system.debug('HR Record id created succefulyy...'+ hrRecord.id );
    
        }
     }
}