public class DMLOperationsHelper 
{
    Public Static Void insertHrRecords()
    { 
        List<Hiring_Manager__c> lstHrRecords = new List<Hiring_Manager__c>();
        
        for(integer counter = 1; counter<=50;counter++)
        {
            Hiring_Manager__c hrRecords = new Hiring_Manager__c();
            
            hrRecords.Name = 'test hr'+counter;
            hrRecords.Contact_number__c = '7765896754';
            
            if(counter !=48)
            {
            hrRecords.Email_ID__c = 'hr'+counter+'@gmail.com';
            }
            hrRecords.Designation__c = 'HR Executive';
            
            lstHrRecords.Add(hrRecords);
        }
        if(!lstHrRecords.isEmpty())
        { 
           List<Database.SaveResult> lstResults = Database.Insert(lstHrRecords,False);
            
        for(Database.SaveResult result : lstResults)
        {
            If(result.isSuccess())
            { 
               System.debug('record has been instrted successfulyy');
               System.debug('Record Id value is '+ result.GetId());
                } 
            else
            {
                List<Database.Error> recordErrors = result.getErrors();
                
                for(Database.Error error : recordErrors)
                {
                    System.debug('Error msessage is'+ error.getMessage());
                    System.debug('Error status code is '+ error.getStatusCode());
                    system.debug('get error filed to display'+ error.getfields());
                }
            }
                System.debug('---------------------------------');
        }
    }
  }
    
    Public Static void upsertCases()
    {
        List<Case> lstcaseRecords = New List<case>();
        
        List<case> lstCases = [Select Id,Priority,Origin,Reason,Status,Subject,Description From Case Where Status = 'New'];
        if(!lstcases.isEmpty())
        {
            for (case cs : lstCases)
            {
                cs.Priority = 'High';
                lstcaseRecords.Add(cs);
            }
        } 
        
        Case cs = new Case();
        cs.Status = 'working';
        cs.Priority = 'high';
        cs.Origin = 'phone';
        cs.type = 'mechanical';
        cs.Reason = 'performance';
        cs.Subject = 'my newly purchased AC not working';
        cs.Description = 'dear customer support i have newly purchased ac not working please solve complaint urgently';
        lstcaseRecords.Add(cs);
        if(!lstcaseRecords.isEmpty())
            upsert lstcaseRecords;
    } 
    
    Public Static void TrasferAccount(String IndustryName, String userRecordName)
    {
        if(IndustryName != Null && IndustryName != ''
           && userRecordName != Null && userRecordName != '')
        {    
            List<Account>lstaccount = [Select Id,name,Rating , Industry, AnnualRevenue,ownerId From account
                                       Where Industry =: IndustryName];
            if(!lstaccount.isEmpty())
            {
                user userinfo = [Select Id,FirstName,LastName,UserName,IsActive From User Where userName =: userRecordName];
                if(userinfo.Id != Null){
                    for(Account acc : lstaccount)
                    {
                        acc.OwnerId = userinfo.Id;
                    }
                    update lstaccount;
                }
            }
            
        }
    }
    
    Public Static void DeActivateUser(String UserRecordName)
    {
        if(UserRecordName != Null && userRecordName != '')
        { 
            User userInfo = [Select Id,FirstName,LastName,UserName,IsActive From User
                             Where UserName =: UserRecordName and IsActive = False];
            if(userInfo.Id != Null)
            {
                userInfo.IsActive = True;
                Update userInfo;
            }
            
        }  
    }
    
    Public Static Void UpdateAccountByRating(String ratingvalue)
    {
        if(ratingValue != Null && ratingValue != '')
        {
            //List<Account> lstAccountRecords = new List<Account>();
            List<Account>lstAccounts = [Select ID,Name,Rating,AnnualRevenue,Type,SLA__c,customerPriority__c,Active__c
                                        From Account
                                        Where Rating =:ratingValue];
            if(!lstAccounts.isEmpty())
            {
                for(Account acc : lstAccounts)
                {
                    acc.AnnualRevenue = 77000000;
                    acc.Type= 'Installation Partner';
                    acc.SLA__c = 'Gold';
                    acc.CustomerPriority__c ='Medium';
                    acc.Active__c = 'yes';
                    //lstAccountRecords.Add(acc);
                }
                update lstAccounts;
            }
        }
    }
    
    
    Public static void RestoreHRRecords(String StartChars)
    {
        Delete [Select ID,Name,Location_name__c,Contact_Number__c,isDeleted From Hiring_Manager__c
                Where Name Like : startChars+'%'];
        System.debug('Number of DML statement used..'+ system.Limits.getDMLStatements());
        System.debug('Number of Records Processed..'+ system.Limits.getDMLRows());
    }
    
}