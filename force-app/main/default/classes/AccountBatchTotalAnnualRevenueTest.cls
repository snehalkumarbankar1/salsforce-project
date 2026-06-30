@isTest()
public class AccountBatchTotalAnnualRevenueTest {

    public testMethod static void testAccountRevenue(){
        //insert account record
        insertAccountRecord();
        
        //invoke batch class
        Test.StartTest();
        
        AccountBatchTotalAnnualRevenue accRevenueBatch = new AccountBatchTotalAnnualRevenue();
        Database.ExecuteBatch(accRevenueBatch);
        
        Test.StopTest();
    }
    public static void insertAccountRecord(){
        
        List<Account>lstAcc = new List<Account>();
        for(integer i=1 ; i<=20 ;i++){
            Account acc= new Account();
            acc.Name = 'suresh patil';
            acc.Phone = '67676786685';
            acc.Fax = '5456555';
            acc.Industry = 'Banking';
            acc.AnnualRevenue = 6567667;
            lstAcc.add(acc);
        }
        if(!lstAcc.isEmpty())
        insert lstAcc;
    }
    
}