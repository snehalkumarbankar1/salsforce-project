public with sharing class FileUploaderController {
   
    @AuraEnabled(cacheable=true)
    public static void uploadFileToAccount(String fileName , String base64Data, String contentType, Id accountId){

    try{
        if(String.isBlank(fileName) || String.isBlank(base64Data)  || accountId == null){
           throw new AuraHandledException('Missing required file Data or account Id'); 
        }
        ContentVersion cv = new ContentVersion();
        cv.Title = fileName.contains('.') ? fileName.substring(0,fileName.lastIndexOf('.')):fileName;
        cv.PathOnClient = fileName;
        cv.VersionData = EncodingUtil.base64Decode(base64Data);
        cv.Origin = 'H';
        insert cv;

        cv = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id = :cv.Id];

        // Link file to Account
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = cv.ContentDocumentId;
        cdl.LinkedEntityId = accountId;
        cdl.ShareType = 'V'; // Viewer access
        cdl.Visibility = 'AllUsers';

        insert cdl;
    }
    catch(Exception e){
           throw new  AuraHandledException( 'Upload Failed'+ e.getMessage());
    }
    }
}