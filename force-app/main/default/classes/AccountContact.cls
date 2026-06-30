public class AccountContact{
    
    public static void afterInsert(List<Account> accList){
        
        if(accList.isEmpty()){
            return;
        }
        List<Contact>lstCon = new List<contact>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.FirstName = 'auto';
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            lstcon.add(con);
        }
        if(!lstcon.isEmpty()){
            insert lstCon;
        }
    }
}