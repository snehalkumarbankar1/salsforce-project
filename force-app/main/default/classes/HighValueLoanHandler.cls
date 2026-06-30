public with sharing class HighValueLoanHandler {

    public static void process(List<Opportunity> opps) {
        if (opps == null) return;

        for (Opportunity opp : opps) {
            if (opp.Amount != null && opp.Amount > 2000000) {
                opp.High_Value_Flag__c = true;
            }
            else {
                opp.High_Value_Flag__c = false;
            }
        }
    }
}