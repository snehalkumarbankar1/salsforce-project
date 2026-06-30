@isTest
public class OpportunityKYCHandlerTest {
 
     @isTest
    static void testIsKycComplete(){
        Account acc = new Account();
        acc.name = 'check KYC';
        acc.phone = '88976778567';
        insert acc;
        
        Contact con = new Contact();
        con.Firstname = 'kyc update';
        con.LastName = 'update';
        con.Phone = '7867866756';
        con.Email = 'skb@gmail.com';
        con.MailingStreet = 'Pune';
        con.AccountId = acc.Id;
        insert con;
        
        opportunity opp = new opportunity();
        opp.Name = 'test opportunity';
        opp.Amount = 500000;
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.Today();
        opp.AccountId = acc.id;
        
        insert opp;
        
        opp.StageName = 'Closed Won';
        
        Test.startTest();
        update opp;
        Test.StopTest();
        
        Opportunity updatedOpp = [SELECT StageName 
                          FROM Opportunity 
                          WHERE Id = :opp.Id];
        
        system.assertEquals('Closed Won',updatedOpp.StageName);
    }
    @isTest
    static void IsKycInComplete(){
        Account acc = new Account();
        acc.name = 'check KYC';
        acc.phone = '88976778567';
        insert acc;
        
        Contact con = new Contact();
        con.Firstname = 'kyc update';
        con.LastName = 'update';
        con.AccountId = acc.Id;
        insert con;
        
        opportunity opp = new opportunity();
        opp.Name = 'test opportunity';
        opp.Amount = 500000;
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.Today();
        opp.AccountId = acc.id;
        
        insert opp;
        
        opp.StageName = 'Closed Won';
        
        Test.startTest();

        try{
            update opp;
            system.assert(false);
        }
        catch(DmlException e){
            system.assert(e.getMessage().contains('KYC incomplete'));
        }
        Test.stopTest();
        
    }
}