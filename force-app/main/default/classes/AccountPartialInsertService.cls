public class AccountPartialInsertService {

    public static void insertAccountsWithErrorLogging(List<Account> accounts) {

        Database.SaveResult[] results = Database.insert(accounts, false);

        for (Integer i = 0; i < results.size(); i++) {

            if (!results[i].isSuccess()) {
  
                String errorMessage = results[i].getErrors()[0].getMessage();
                
                String accName = accounts[i].Name;

   ErrorLogUtil.logError(errorMessage,'AccountPartialInsertService.insertAccountsWithErrorLogging',null);
            }
        }
    }
}