@isTest
public class OpportunityRiskUtilTest {

     @isTest
    static void testCalculateLowRisk(){
        String result = OpportunityRiskUtil.calculateRisk(null);
        system.assertEquals('LOW',result);
       
         Opportunity opp1 = new Opportunity();
            
        opp1.stageName = 'Proposal';
        opp1.CloseDate = Date.today();
        opp1.Name = 'risk';
        opp1.Amount = 400000;
        
        Test.startTest();
        String result1 = OpportunityRiskUtil.calculateRisk(opp1);
        Test.stopTest();    
        system.assertEquals('LOW',result1);
    } 
        @isTest
        static void testCalculateHighRisk(){
            
        Opportunity opp = new Opportunity();
            
        opp.stageName = 'Proposal';
        opp.CloseDate = Date.today();
        opp.Name = 'risk';
        opp.Amount = 1500000;
        
        Test.startTest();
        String result = OpportunityRiskUtil.calculateRisk(opp);
        Test.stopTest();    
        system.assertEquals('HIGH',result);
   }  
       @isTest
        static void testCalculateMediumRisk(){
            
            Opportunity opp = new Opportunity();
            
        opp.stageName = 'Qualification';
        opp.CloseDate = Date.today();
        opp.Name = 'risk';
        opp.Amount = 600000;
        
        Test.startTest();
        String result = OpportunityRiskUtil.calculateRisk(opp);
        Test.stopTest();    
        system.assertEquals('MEDIUM',result);
            
    }
    @isTest
      static void testAssignRisk(){
          
        
        Opportunity opp1 = new Opportunity();
            
        opp1.stageName = 'Proposal';
        opp1.CloseDate = Date.today();
        opp1.Name = 'risk';
        opp1.Amount = 2000000;
          
          Opportunity opp2 = new Opportunity();
            
        opp2.stageName = 'Proposal';
        opp2.CloseDate = Date.today();
        opp2.Name = 'risk';
        opp2.Amount = 600000;
          
          Opportunity opp3 = new Opportunity();
            
        opp3.stageName = 'Proposal';
        opp3.CloseDate = Date.today();
        opp3.Name = 'risk';
        opp3.Amount = 400000;
          
          List<Opportunity>opps = new List<Opportunity>{opp1,opp2,opp3};
          
        Test.startTest();
          OpportunityRiskUtil.assignRisk(opps);
          Test.stopTest();
          
          System.assertEquals('HIGH', opp1.Description);
        System.assertEquals('MEDIUM', opp2.Description);
        System.assertEquals('LOW', opp3.Description);
      }
     @isTest
    static void testAssignRisk_EmptyList() {

        Test.startTest();
        OpportunityRiskUtil.assignRisk(new List<Opportunity>());
        Test.stopTest();  
        
         System.assert(true);
      } 
          
    }