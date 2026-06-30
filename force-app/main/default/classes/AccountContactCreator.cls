public class AccountContactCreator 
{
       Public Static void createAccountsWithContacts(List<Account> accs, List<Contact> cons)
       {
           if(accs == null || accs.isEmpty())
           {
               return;
           }
           insert accs;
           
        if(cons != null && !cons.isEmpty())
    {
        Integer sizeToProcess = Math.min(accs.size(),cons.size());
        for(Integer i = 0; i< sizeToProcess; i++)
        {
            cons[i].AccountId = accs[i].Id;
        }
        insert cons;
    }

       }
    
}