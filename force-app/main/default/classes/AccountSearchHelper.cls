@RestResource(URLMapping = '/SearchAccountService/*')
Global class AccountSearchHelper {
        @HttpDelete()
    Global static String deleteAccountsByName(){
        map<string,string> mapParams = RestContext.request.params;
        List<Account>lstAcc = [SELECT Id,Name,rating,Phone ,Fax FROM Account
                               WHERE Name =: mapParams.Get('accname')];
        if(!lstAcc.isEmpty()){
           delete lstAcc;
            return 'Account delete succefully';
        }
        else{
            return 'Account not Found';
        }
    }
}