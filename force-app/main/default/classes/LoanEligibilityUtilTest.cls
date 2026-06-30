@isTest
public class LoanEligibilityUtilTest {

    @isTest
     static void eligibleAmount(){
        
       Decimal result1 = LoanEligibilityUtil.calculateEligibleAmount(null);
        system.assertEquals(0,result1);
        
        Account acc = new Account();
         acc.Name = 'rudra';
        insert acc;
        Decimal result2 = LoanEligibilityUtil.calculateEligibleAmount(acc);
        system.assertEquals(0,result2);
        
         Account acc1 = new Account();
         acc1.Name = 'rudra';
         acc1.AnnualRevenue = 800000;
        insert acc1;
        Decimal result3 = LoanEligibilityUtil.calculateEligibleAmount(acc1);
        system.assertEquals(4000000,result3);
        
        Decimal result4 =LoanEligibilityUtil.calculateEMI(null,10,12);
        system.assertEquals(0,result4);
        
        Decimal result5 =LoanEligibilityUtil.calculateEMI(100000,null,12);
        system.assertEquals(0,result5);
        
        Decimal result6 =LoanEligibilityUtil.calculateEMI(100000,10,null);
        system.assertEquals(0,result6);
        
        System.assertEquals(0,LoanEligibilityUtil.calculateEMI(100000, 10, 0));
                            
        Decimal result7 =LoanEligibilityUtil.calculateEMI(100000,10,12);
        system.assert(result7 > 0,'Emi should be greater than zero');
        
        system.assertEquals('LOW',LoanEligibilityUtil.categorizeRisk(null));
         system.assertEquals('HIGH',LoanEligibilityUtil.categorizeRisk(1500000));
         system.assertEquals('MEDIUM',LoanEligibilityUtil.categorizeRisk(700000));
         system.assertEquals('LOW',LoanEligibilityUtil.categorizeRisk(200000));
    }
}