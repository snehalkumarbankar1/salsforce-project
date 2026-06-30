@isTest
public class KYCValidatorUtilTest {
    
    @isTest
    static void testIsKYCComplete_Null(){
        test.startTest();
        Boolean result = KYCValidatorUtil.isKYCComplete(null);
        Test.stopTest();

        System.assertEquals(false, result);
    }
    
     @isTest
        static void KycCompleteTrue(){
        
            contact con = new Contact();
            con.lastName = 'Test kyc';
            con.Email = 'skbankar@gmail.com';
            con.Phone = '9876655634';
            con.MailingCity = 'pune';
            
            insert con;
            
            test.StartTest();
            Boolean result = KYCValidatorUtil.isKYCComplete(con);
            test.stopTest();
            system.assertEquals(true,result,'kyc complete');
    }
    
    @isTest
    static void kycCompletefalse(){
        contact con = new Contact();
            con.lastName = 'Test kyc';
        
        insert con;
        
        Boolean result = KYCValidatorUtil.isKYCComplete(con);
            test.stopTest();
            system.assertEquals(false,result,'kyc incomplete');
      }
    
    @isTest
    static void bulkKycCheck(){
       contact con = new contact();
        con.lastName = 'Test kyc';
            con.Email = 'skbankar@gmail.com';
            con.Phone = '9876655634';
            con.MailingCity = 'pune';
        
        contact con1 = new contact();
        con1.lastName = 'Test kyc';
        
        List<Contact>lstcon = new List<contact>{con,con1};
        insert lstcon;
        
        set<Id>setIds = new set<Id>{con.id,con1.id};
            
            test.startTest();
         Map<Id, Boolean> resultMap = KYCValidatorUtil.checkBulkKYC(setIds);
        test.stoptest();
        system.assertEquals(0,resultMap.size());
        system.assertEquals(true,resultMap.get(con.id));
        system.assertEquals(false,resultMap.get(con1.id));
    }
    @isTest
    static void testCheckBulkKYC_EmptySet(){
        test.startTest();
         Map<Id, Boolean> resultMap = KYCValidatorUtil.checkBulkKYC(new set<Id>());
        test.stoptest();
        system.assertEquals(0,resultMap.size());
        
    }
      
}