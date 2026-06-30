@isTest
public class HighValueLoanHandlerTest {

     @isTest
    static void testHighValueFlagTrue(){
        
        Opportunity opp = new Opportunity();
         opp.Name = 'test opp';
        opp.Amount = 3000000;
        opp.CloseDate = Date.Today();
        opp.StageName = 'Prospecting';
        
         Opportunity opp1 = new Opportunity();
         opp1.Name = 'test opp';
        opp1.Amount = 100000;
        opp1.CloseDate = Date.Today();
        opp1.StageName = 'Prospecting';
        
        List<Opportunity>lstOpp = new List<Opportunity>{opp,opp1};
           
            insert lstOpp;
            
        List <Opportunity> newOpp = [SELECT Id,Name,Amount,CloseDate,StageName,High_Value_Flag__c FROM Opportunity
                                   WHERE Id IN : new Set<Id>{opp.id,opp1.id}];
        for(Opportunity op : newOpp){
            if(op.Amount>2000000){
                
                system.assertEquals(true,op.High_Value_Flag__c);
            }
            else{
                
                system.assertEquals(false,op.High_Value_Flag__c);
            }
        }
    }
}