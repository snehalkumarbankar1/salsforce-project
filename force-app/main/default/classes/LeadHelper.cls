Public class LeadHelper
{
      public Static Void searchAccountRecords(String searchChars)
    {
        if(searchChars !=Null && searchChars != '')
        {  
            searchChars += '%';
        String accountsQuery = 'Select ID, Name, AnnualRevenue, Industry,Rating, Active__C From Account Where Name Like : searchChars';
                    List<Account> lstAccounts = Database.Query(accountsQuery); 
        System.debug('account records collection is..:'+ lstAccounts.Size());
        if(!lstAccounts.Isempty())
        {
            For(Account acc : lstAccounts)
            {
                System.debug('account records are...'+acc);
            }
        }
    }
}
}