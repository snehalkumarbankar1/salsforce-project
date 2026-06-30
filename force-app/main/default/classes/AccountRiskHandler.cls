public with sharing class AccountRiskHandler {

    public static void updateRisk(List<Opportunity> opps) {

        Set<Id> accountIds = new Set<Id>();

        for (Opportunity o : opps) {
            if (o.AccountId != null) {
                accountIds.add(o.AccountId);
            }
        }

        if (accountIds.isEmpty()) return;

        Map<Id, Decimal> totals = new Map<Id, Decimal>();

        for (AggregateResult ar : [
            SELECT AccountId accId, SUM(Amount) totalAmt
            FROM Opportunity
            WHERE AccountId IN :accountIds
            AND IsClosed = false
            GROUP BY AccountId
        ]) {
            totals.put(
                (Id) ar.get('accId'),
                (Decimal) ar.get('totalAmt')
            );
        }

        List<Account> accsToUpdate = new List<Account>();

        // 🔥 IMPORTANT FIX: Loop over ALL accountIds, not totals
        for (Id accId : accountIds) {

            Decimal totalAmount = totals.containsKey(accId)
                ? totals.get(accId)
                : 0;

            Account acc = new Account(Id = accId);

            acc.Risk_Rating__c =
                totalAmount > 2000000 ? 'HIGH' : 'LOW';

            accsToUpdate.add(acc);
        }

        if (!accsToUpdate.isEmpty()) {
            update accsToUpdate;
        }
    }
}