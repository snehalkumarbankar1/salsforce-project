public class AccountPhoneUpdater 
{
    public static void updateAccountPhones(Map<String,String> nameToPhoneMap)
    {
        if( nametoPhoneMap == null || nametoPhoneMap.isEmpty())
        {
            return;
        }
        List<Account> lstAccounts = [SELECT Id, Name,Phone FROM Account WHERE Name IN: nameToPhoneMap.keyset()];
        
        if(!lstAccounts.isEmpty())
        {
          for(Account acc : lstAccounts)
          {
              acc.Phone = nameToPhoneMap.get(acc.Name);
          }
            update lstAccounts;
        }
        
        
    }
}