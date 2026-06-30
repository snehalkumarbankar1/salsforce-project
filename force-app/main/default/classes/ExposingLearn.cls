@RestResource(URLMapping='/getAccounts/*')
Global class ExposingLearn {
    @HttpGET
    Global static List<Account> getAccs(){
        map<string,string> mapParam = RestContext.request.params;
      List<Account> lstAccs = [SELECT Id,Name,Rating,Phone,Industry FROM Account
                              where Id=:mapParam.get('id') AND Name=:mapParam.get('name')];
         return lstAccs;
    }
}