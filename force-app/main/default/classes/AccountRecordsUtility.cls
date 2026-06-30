public class AccountRecordsUtility {

     Public static void CreateNewAccount()
     {
         Account acc = new Account();
         acc.Name = 'pratap rana';
         acc.BillingCity = 'mumbai';
         acc.Phone = '7876543456';
         acc.AnnualRevenue = 2500000;
         acc.Rating = 'warm';
         acc.Industry = 'manufacturing';
         acc.Active__c = 'yes';
         insert acc;
         if(acc.Id != Null)
         {  
             System.debug('account record is created..' + acc.Id);
             CreateRelatedContact(acc.Id);
         }   
     } 
         Public static void CreateRelatedContact(Id accountRecordId )
         { 
             if(accountRecordId != null)
                 
             {
                 Contact con = new contact();
                 
                 con.FirstName = 'raghu';
                 con.LastName = 'varun';
                 con.Title = 'business analyst';
                 con.Department = 'development';
                 con.Phone = '8975666343';
                 con.Email = 'raghu.v@gmail.com';
                 con.AccountId = accountRecordId ;
                 
                 insert con;
                 
                 if (con != null)
                     System.debug('related contact record is created' + con.Id);
             }
         }
                 
}