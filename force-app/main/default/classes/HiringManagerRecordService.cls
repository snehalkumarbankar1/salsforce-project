@RestResource(URLMapping='/HiringManagerService/*')
Global class HiringManagerRecordService {
  @HttpGet()
    Global Static List<Hiring_Manager__c> getBangloreHrRecords(){
       List<Hiring_Manager__c> lstHRRecords = [SELECT Id,Name,Location_Name__c,Email_Id__c,
                                               Contact_Number__c FROM Hiring_Manager__c
                                               WHERE Location_Name__c ='Pune'];
        return lstHRRecords; 
    }
}