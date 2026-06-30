public class HiringManagerHelper {
	
    public static void deleteHRRecords(){
        
        List<Hiring_Manager__c> lstHrRecords = [SELECT Id,Name FROM Hiring_Manager__c
                                                WHERE Name LIKE 'test%' ];
        delete lstHrRecords;
        
    }
    
}