@isTest
public class LoanThresholdHandlerTest {

     @testSetup
    static void setupData(){
        Account acc = new Account(Name = 'test1');
        insert acc;
    }
     @isTest
    static Void loanExceeds(){
         Account acc = [SELECT Id FROM Account Limit 1];
        Opportunity opp = new Opportunity();
         opp.Name = 'test1';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.Today();
        opp.Amount = 2000000;
        opp.AccountId = acc.id;
        
        Test.startTest();
        try{
            insert opp;
            system.assert(false,'Record should not have been inserted');
        }
        catch(DmlException e){
           system.assert(e.getMessage().contains('Loan exceeds configured threshold.')); 
        }
        Test.stopTest();
    }
    @isTest
    static void loanNotexceeds(){
        Account acc = [SELECT Id FROM Account Limit 1];
        
        Opportunity opp = new Opportunity();
         opp.Name = 'test1';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.Today();
        opp.Amount = 500000;
        opp.AccountId = acc.id;
        
        Test.startTest();
        insert opp;
        Test.stopTest();
        system.assertNotEquals(null,opp.id);
        
    }
     @isTest
    static void testBulkInsert() {

        Account acc = [SELECT Id FROM Account LIMIT 1];

        List<Opportunity> oppList = new List<Opportunity>();

        // Valid record
        oppList.add(new Opportunity(
            Name = 'Bulk Valid',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 400000,
            AccountId = acc.Id
        ));

        // Invalid record
        oppList.add(new Opportunity(
            Name = 'Bulk Invalid',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 2500000,
            AccountId = acc.Id
        ));
      Test.startTest();
        list<database.saveResult> results = database.insert(oppList,false);
      Test.stopTest();
        System.assertEquals(True,results[0].isSuccess());
        System.assertEquals(false, results[1].isSuccess());
        System.assert(results[1].getErrors()[0].getMessage().contains('Loan exceeds configured threshold.'));
    }   
}