public class PipelineHierarchyService {

    public static Map<Id, Map<Id, List<Opportunity>>> 
        buildOwnerAccountOppHierarchy(Set<Id> oppIds) {

        Map<Id, Map<Id, List<Opportunity>>> resultMap =
            new Map<Id, Map<Id, List<Opportunity>>>();

        if (oppIds == null || oppIds.isEmpty()) {
            return resultMap;
        }

        List<Opportunity> oppList = [ SELECT Id, Name, AccountId, Account.OwnerId, StageName
                                      FROM Opportunity WHERE Id IN :oppIds
                                      AND StageName != 'Closed Won'
                                      AND StageName != 'Closed Lost'];

        for (Opportunity opp : oppList) {
          
            if (opp.AccountId == null) {
                continue;
            }

            Id ownerId = opp.Account.OwnerId;
            Id accountId = opp.AccountId;

            if (!resultMap.containsKey(ownerId)) {
                resultMap.put(ownerId, new Map<Id, List<Opportunity>>());
            }

            Map<Id, List<Opportunity>> accountMap =
                resultMap.get(ownerId);

            if (!accountMap.containsKey(accountId)) {
                accountMap.put(accountId, new List<Opportunity>());
            }

            accountMap.get(accountId).add(opp);
        }

        return resultMap;
    }
}