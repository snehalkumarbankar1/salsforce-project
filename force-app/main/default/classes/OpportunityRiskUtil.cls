public with sharing class OpportunityRiskUtil {

    public static String calculateRisk(Opportunity opp) {
        if (opp == null || opp.Amount == null) return 'LOW';

        if (opp.Amount > 1000000 && opp.StageName == 'Proposal') {
            return 'HIGH';
        }
        if (opp.Amount > 500000) {
            return 'MEDIUM';
        }
        return 'LOW';
    }

    public static void assignRisk(List<Opportunity> opps) {
        if (opps == null || opps.isEmpty()) return;

        for (Opportunity o : opps) {
            o.Description = calculateRisk(o);
        }
    }
}