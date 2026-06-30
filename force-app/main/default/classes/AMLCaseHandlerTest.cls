@isTest
public class AMLCaseHandlerTest {

     @isTest
    static void highRiskCostomer(){
        
        Opportunity opp = new Opportunity();
        opp.Name = 'test';
        opp.Amount = 2000000;
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'test1';
        opp1.Amount = 1000000;
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = Date.today();
        
        List<Opportunity> oppList = new List<Opportunity>{opp,opp1}; 
            
             Test.startTest();
            insert oppList;
             Test.stopTest();
        
       List<Case> caseList = [SELECT Id, Subject, Opportunity__c FROM Case WHERE Opportunity__c = :opp.Id ];

        System.assertEquals(1, caseList.size(), 'Case should be created for high amount opportunity');
        System.assertEquals('AML Review Required', caseList[0].Subject);
    }
  
}