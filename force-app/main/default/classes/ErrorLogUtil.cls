public class ErrorLogUtil {
    public static void logError(String message, String context, String recordId){
        
        try{
            Error_Log__c log = new Error_Log__c();
            log.Message__c = message;
            log.Context__c = context;
            log.Record_Id__c = recordId != null ? String.valueOf(recordId) : null;
            
            insert log;
        }
        catch (Exception e){
            System.debug('Error while logging error :'+ e.getMessage());
        }
    }
}