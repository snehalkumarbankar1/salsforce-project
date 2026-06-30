public with sharing class OpportunityKYCHandler {

    public static void handleBeforeUpdate(List<Opportunity> newList, Map<Id, Opportunity> oldMap) {
        if (newList == null || newList.isEmpty()) return;

        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : newList) {
            if (opp.AccountId != null && opp.StageName == 'Closed Won' &&
                oldMap.get(opp.Id).StageName != 'Closed Won') {
                accountIds.add(opp.AccountId);
            }
        }

        if (accountIds.isEmpty()) return;

        Map<Id, Contact> accToPrimary = new Map<Id, Contact>();
        for (Contact c : [SELECT Id, AccountId, Email, Phone, MailingStreet 
                          FROM Contact WHERE AccountId IN :accountIds LIMIT 200]) {
            if (!accToPrimary.containsKey(c.AccountId)) {
                accToPrimary.put(c.AccountId, c);
            }
        }

        for (Opportunity opp : newList) {
            if (opp.AccountId != null && accToPrimary.containsKey(opp.AccountId)) {
                if (!KYCValidatorUtil.isKYCComplete(accToPrimary.get(opp.AccountId))) {
                    opp.addError('KYC incomplete. Cannot approve loan.');
                }
            }
        }
    }
}