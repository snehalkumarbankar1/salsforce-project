public with sharing class AMLCaseHandler {

    private static Boolean isExecuting = false;

    public static void afterInsert(List<Opportunity> opps) {
        if (isExecuting) return;
        isExecuting = true;

        List<Case> casesToInsert = new List<Case>();

        for (Opportunity opp : opps) {
            if (opp.Amount != null && opp.Amount > 1500000) {
                Case c = new Case();
                c.Subject = 'AML Review Required';
                c.Status = 'New';
                c.Origin = 'System';
                c.Opportunity__c = opp.Id;
                casesToInsert.add(c);
            }
        }

        if (!casesToInsert.isEmpty()) {
            insert casesToInsert;
        }
    }
}