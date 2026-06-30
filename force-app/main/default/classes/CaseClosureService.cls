public class CaseClosureService {

    public static void closeCasesWithReason(Set<Id> caseIds, String reason){
        
        if(caseIds == null || caseIds.isEmpty() ){
            return;
        }
        if(StringUtil.isBlank(reason)){
            return;
        }
        
        List<Case> casesToClose = [SELECT Id, Status, Closed_Reason__c
                                                       FROM Case WHERE  
                                                       Id IN :caseIds];
        for(Case cs : casesToClose){
                cs.Status = 'Closed';
                cs.Closed_Reason__c = reason;
            }  
        if(!casesToClose.isEmpty()){
        update casesToClose;
        }
    }
}