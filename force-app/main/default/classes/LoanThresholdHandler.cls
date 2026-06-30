public with sharing class LoanThresholdHandler {

    public static void validate(List<Opportunity> opps) {
        if (opps == null || opps.isEmpty()) return;

        Loan_Config__mdt config = Loan_Config__mdt.getInstance('Default');

        Decimal maxLimit = config != null ? config.Max_Loan_Amount__c : 1000000;
        for (Opportunity opp : opps) {
            if (opp.Amount != null && opp.Amount > maxLimit) {
                opp.addError('Loan exceeds configured threshold.');
            }
        }
    }
}