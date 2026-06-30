@RestResource(URLMapping='/CaseDetailsService/*')
Global class CaseManagerHelper {
  @HttpGet()
    Global static Case getCaseRecordByNumber()
    {
        Map<String,String> inputParams = RestContext.request.params;
        Case caseRecord = [SELECT Id,CaseNumber,Status,Type,Priority,Origin,Reason,Subject,Description 
                           FROM Case WHERE CaseNumber =: inputParams.Get('cNumber')];
        return caseRecord;
    }
}