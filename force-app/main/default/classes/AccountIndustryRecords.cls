@RestResource(URLMapping='/AccountIndustryRecords/*')
Global class AccountIndustryRecords { 
 @HttpGet()
    Global Static List<Account> GetAccountRecords(){
        Map<String,String> inputParams = RestContext.request.params;
        List<Account> lstAccounts = [SELECT Id,Name,AnnualRevenue,Industry,Phone,Fax,Rating
                                     FROM Account WHERE Industry =: inputParams.Get('indName')];
        return lstAccounts;
    }
    @HttpDelete()
    Global static string deleteAccount(){
        Map<string,string> inputParams = RestContext.request.params;
    List<Account> lstAccounts = [SELECT Id,Name,Rating,Phone,Fax FROM Account WHERE
                               Name =: inputParams.Get('accName')];
        if(!lstAccounts.isEmpty()){
            delete lstAccounts;
            return 'Account deleted';
        }
        else{
            return 'Account not found';
        }
    }
    @HttpPost()
    Global static String contactCreation(String fName,String lName,String phone,String fax){
        Contact con = new Contact();
        con.FirstName = fName;
        con.LastName = lName;
        con.Phone = phone;
        con.Fax = fax;
        insert con;
        if(con.Id != null){
            return 'Contact record Created succefully';
        }
        else
        {
            return 'Record not created';
        }
    }
}