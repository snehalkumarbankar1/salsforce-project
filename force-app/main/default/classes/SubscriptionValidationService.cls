public class SubscriptionValidationService {
   
    public class SubscriptionValidationException extends Exception{}
    
    public static void validateSubscriptions(List<Subscription__c> subs){
        
        if(subs == null || subs.isEmpty()){
            return;
        }
         Set<Id> accIds = new Set<Id>();
        
        for(Subscription__c sub :subs){
            if(sub.account__c != null){
                accIds.add(sub.account__c);
            }
        }
               
     List<Subscription__c> existingActiveSubs = [SELECT Id, Account__c FROM Subscription__c
                                                 WHERE Status__c = 'Active'
                                                 AND Account__c IN :accIds];
        
             Map<Id, Integer> activeSubCountByAccount = new Map<Id, Integer>();
        
        for (Subscription__c sub : existingActiveSubs) {
            
            Integer count = activeSubCountByAccount.get(sub.Account__c);
            activeSubCountByAccount.put(sub.Account__c,count == null ? 1 : count + 1);
            }

        // Step 4: Validate incoming subscriptions
        List<String> errors = new List<String>();

        for (Subscription__c sub : subs) {

            // Only validate ACTIVE subscriptions
            if (sub.Status__c == 'Active') {

                // Rule 2: Start Date must not be null
                if (sub.Start_Date__c == null) {
                    errors.add(
                        'Start Date is required for Active subscription (Account: '
                        + sub.Account__c + ')'
                    );
                }

                // Rule 1: Only one active subscription per Account
                Integer existingCount =
                    activeSubCountByAccount.get(sub.Account__c);

                if (existingCount != null && existingCount > 0) {
                    errors.add(
                        'Account already has an Active Subscription (Account: '
                        + sub.Account__c + ')'
                    );
                }

                // Increase count to include current record
                activeSubCountByAccount.put(
                    sub.Account__c,
                    (existingCount == null ? 1 : existingCount + 1)
                );
            }
        }

        // Step 5: Throw exception if any errors found
        if (!errors.isEmpty()) {
            throw new SubscriptionValidationException(
                String.join(errors, ' | ')
            );
        }
    }
}