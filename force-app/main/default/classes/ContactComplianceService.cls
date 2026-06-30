public class ContactComplianceService {

    public class ContactComplianceException extends Exception {}

    public static void validateContacts(List<Contact> contacts) {

        if (contacts == null || contacts.isEmpty()) {
            return;
        }

        Set<Id> accountIds = new Set<Id>();
        for (Contact c : contacts) {
            if (c.AccountId != null) {
                accountIds.add(c.AccountId);
            }
        }

     Map<Id, Account> accountMap = new Map<Id, Account>([ SELECT Id, Actives__c, Region__c
                                                            FROM Account WHERE Id IN :accountIds ]);

        List<String> errors = new List<String>();
        Integer index = 0;

        for (Contact c : contacts) {

            Account acc = accountMap.get(c.AccountId);

          
            if (acc == null) {
                errors.add('Contact #' + index + 'no valid parent Account.');
            }
            else if (!acc.Actives__c) {
                    errors.add('Contact #' + index + ' Parent Account is inactive.');
            }
            
             else if (String.isBlank(acc.Region__c)) {
                     errors.add('Contact #' + index + 'Parent Account has no Region.');
             }
              index++;
        }

        if (!errors.isEmpty()) {
     throw new ContactComplianceException('Contact Compliance Validation Failed' +String.join(errors, '\n'));
        }
    }
}