public class AccountValidationService
{
    public class LowRevenueException extends Exception{}
    
    public static void insertValidatedAccounts(List<Account> accounts)
    {
        if (accounts == null || accounts.isEmpty()) 
        { return;
        }
            for (Account acc : accounts)
            {
                if (acc.AnnualRevenue != null && acc.AnnualRevenue < 50000 )
                {
                    throw new LowRevenueException('Annual Revenue is less than 50,000'+ acc.Name);
                }
            }
            
            insert accounts;
        }
    }