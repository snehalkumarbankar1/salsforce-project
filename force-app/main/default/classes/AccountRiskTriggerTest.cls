@isTest
public class AccountRiskTriggerTest {

    // Utility method to get an Open Stage dynamically
    private static String getOpenStage() {
        return [
            SELECT MasterLabel 
            FROM OpportunityStage 
            WHERE IsClosed = false 
            LIMIT 1
        ].MasterLabel;
    }

    @isTest
    static void testHighRiskOnInsert() {

        String openStage = getOpenStage();

        Account acc = new Account(Name = 'High Risk Account');
        insert acc;

        List<Opportunity> opps = new List<Opportunity>{
            new Opportunity(
                Name = 'Opp1',
                StageName = openStage,
                CloseDate = Date.today().addDays(10),
                Amount = 1500000,
                AccountId = acc.Id
            ),
            new Opportunity(
                Name = 'Opp2',
                StageName = openStage,
                CloseDate = Date.today().addDays(10),
                Amount = 1000000,
                AccountId = acc.Id
            )
        };

        Test.startTest();
        insert opps;
        Test.stopTest();

        Account result = [SELECT Risk_Rating__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals('HIGH', result.Risk_Rating__c);
    }


    @isTest
    static void testLowRiskOnInsert() {

        String openStage = getOpenStage();

        Account acc = new Account(Name = 'Low Risk Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Opp Low',
            StageName = openStage,
            CloseDate = Date.today().addDays(10),
            Amount = 500000,
            AccountId = acc.Id
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Account result = [SELECT Risk_Rating__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals('LOW', result.Risk_Rating__c);
    }


    @isTest
    static void testUpdateFromLowToHigh() {

        String openStage = getOpenStage();

        Account acc = new Account(Name = 'Update Risk Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Opp Update',
            StageName = openStage,
            CloseDate = Date.today().addDays(10),
            Amount = 500000,
            AccountId = acc.Id
        );

        insert opp;

        // Initially LOW
        Account checkAcc = [SELECT Risk_Rating__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals('LOW', checkAcc.Risk_Rating__c);

        // Update to HIGH
        opp.Amount = 3000000;

        Test.startTest();
        update opp;
        Test.stopTest();

        checkAcc = [SELECT Risk_Rating__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals('HIGH', checkAcc.Risk_Rating__c);
    }


    @isTest
    static void testBulkInsert() {

        String openStage = getOpenStage();

        List<Account> accs = new List<Account>{
            new Account(Name = 'Bulk Account 1'),
            new Account(Name = 'Bulk Account 2')
        };
        insert accs;

        List<Opportunity> opps = new List<Opportunity>{
            new Opportunity(
                Name = 'Bulk Opp 1',
                StageName = openStage,
                CloseDate = Date.today().addDays(10),
                Amount = 3000000,
                AccountId = accs[0].Id
            ),
            new Opportunity(
                Name = 'Bulk Opp 2',
                StageName = openStage,
                CloseDate = Date.today().addDays(10),
                Amount = 100000,
                AccountId = accs[1].Id
            )
        };

        Test.startTest();
        insert opps;
        Test.stopTest();

        Map<Id, Account> results = new Map<Id, Account>(
            [SELECT Risk_Rating__c FROM Account WHERE Id IN :accs]
        );

        System.assertEquals('HIGH', results.get(accs[0].Id).Risk_Rating__c);
        System.assertEquals('LOW', results.get(accs[1].Id).Risk_Rating__c);
    }
}