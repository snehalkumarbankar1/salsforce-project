public class AccountContactStatsService {

    public static Map<Id, Integer> getContactCountByAccount(Set<Id> accountIds) {

        Map<Id, Integer> accToConCount = new Map<Id, Integer>();

        if (accountIds == null || accountIds.isEmpty()) {
            return accToConCount;
        }

        for (Id acId : accountIds) {
            accToConCount.put(acId, 0);
        }

        List<AggregateResult> result = [ SELECT AccountId accId, COUNT(Id) totalContacts
                                           FROM Contact WHERE AccountId IN :accountIds
                                            GROUP BY AccountId];

        for (AggregateResult ar : result) {
            Id accId = (Id) ar.get('accId');
            Integer totalCount = (Integer) ar.get('totalContacts');

            accToConCount.put(accId, totalCount);
        }

        return accToConCount;
    }
}