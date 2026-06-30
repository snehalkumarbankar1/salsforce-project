@isTest
public class CreditScoreUtilTest {

     @isTest
    static void creditScoreValid(){
        
        Opportunity opp = new Opportunity();
        opp.Name = 'test opp valid';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 600000;
        opp.Credit_Score__c = 700;
        
        Test.startTest();
        insert opp;
        Test.StopTest();
        system.assertNotEquals(null,opp.id);
    }
     @isTest
    static void LowcreditScoreValid(){
        Opportunity opp = new Opportunity();
        opp.Name = 'test opp valid';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 600000;
        opp.Credit_Score__c = 600;
        
        Test.startTest();
        try{
        insert opp;
            system.assert(false,'exeption occure');
        }
        Catch(Exception e){
          system.assert(e.getmessage().contains('credit score insufficient'));  
        }
        Test.StopTest();
    }
     @isTest
    static void LowAmountValidation(){
          opportunity opp = new Opportunity();
        opp.Name = 'test opp valid';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 400000;
        opp.Credit_Score__c = 600;
        
        Test.startTest();
        insert Opp;
        Test.StopTest();
        system.assertNotEquals(null,opp.id);
    }
            
        
        // Test isCreditScoreValid
         @isTest
    static void testUtilityMethodsDirectly() {
        
      system.assertEquals(false,CreditScoreUtil.isCreditScoreValid(null));
        
       System.assertEquals(false, CreditScoreUtil.isCreditScoreValid(600));
        
         system.assertEquals(True,CreditScoreUtil.isCreditScoreValid(700));
        
        // Test getCreditGrade
         system.assertEquals('UNKNOWN',CreditScoreUtil.getCreditGrade(null));
        
        system.assertEquals('A',CreditScoreUtil.getCreditGrade(850));
        
        system.assertEquals('B',CreditScoreUtil.getCreditGrade(750));
        
        system.assertEquals('C',CreditScoreUtil.getCreditGrade(680));
        
        system.assertEquals('D',CreditScoreUtil.getCreditGrade(600));
        
        test.starttest();
        
           CreditScoreUtil.validateOpportunities(null);
        
          CreditScoreUtil.validateOpportunities(new List<Opportunity>());
        
        test.stoptest();
    }
}