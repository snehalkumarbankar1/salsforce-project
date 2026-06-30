@RestResource(URLMapping='/AccountService/*')
Global class AccountRecordService {

    @HttpGet()
    Global static List<Account> GetAllAccounts(){
         List<Account> lstAccounts = [SELECT Name,AnnualRevenue,Rating,Phone,Fax,Type
                                           FROM Account ORDER BY Name];
        return lstAccounts;
    }
}