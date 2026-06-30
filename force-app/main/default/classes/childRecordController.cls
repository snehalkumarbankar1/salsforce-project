public with sharing class childRecordController {

     @AuraEnabled(cacheable=true)
     public static List<sObject> getRelatedRecords(Id recordId, String childApiName, 
                                             String fieldList, String lookupFieldApiName, 
                                             Integer limitSize ){
                                                
                   if(String.isBlank(childApiName) || String.isBlank(fieldList) ||
                        String.isBlank(lookupFieldApiName)){
                           throw new AuraHandledException('Invalid input');
                         }

    String soql = 'SELECT '+ fieldList+ 
    ' FROM '+ childApiName+ 
    ' WHERE '+ lookupFieldApiName + ' = :recordId ' + 
    ' LIMIT '+limitSize;
  return Database.query(soql);
}
}