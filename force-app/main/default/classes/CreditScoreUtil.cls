public with sharing class CreditScoreUtil {

    // Check if credit score is valid
    public static Boolean isCreditScoreValid(Integer score) {
        if (score == null) {
            return false;
        }
        return score >= 650;
    }

    // Get credit grade
    public static String getCreditGrade(Integer score) {
        if (score == null) return 'UNKNOWN';
        if (score >= 800) return 'A';
        if (score >= 700) return 'B';
        if (score >= 650) return 'C';
        return 'D';
    }

    // Validate Opportunities
    public static void validateOpportunities(List<Opportunity> opps) {
        if (opps == null || opps.isEmpty()) {
            return;
        }

        for (Opportunity opp : opps) {

            // Get credit score from record
            Integer score = (Integer) opp.Credit_Score__c;

            if (opp.Amount != null 
                && opp.Amount > 500000 
                && !isCreditScoreValid(score)) {

                opp.addError('Credit score insufficient for high value loan.');
            }
        }
    }
}