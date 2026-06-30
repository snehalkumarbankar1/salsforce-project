trigger HiringManagerTrigger on Hiring_Manager__c (after delete) {

    if(Trigger.isAfter && Trigger.IsDelete){
        
        Set<Id> hrRecordIds = new Set<Id>();
        for(Hiring_Manager__c hrRecord : Trigger.Old){
            hrRecordIds.add(hrRecord.Id);
            
            list<Position__c> deletePosRec = [SELECT Id FROM Position__c WHERE Hiring_Manager__c IN :hrRecordIds];
            
            if(!deletePosRec.isEmpty()){
            delete deletePosRec;
        }
        }
    }
}