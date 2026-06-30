public with sharing class KYCValidatorUtil {

    public static Boolean isKYCComplete(Contact con) {
        if (con == null) return false;
        return String.isNotBlank(con.Email) &&
               String.isNotBlank(con.Phone) &&
               String.isNotBlank(con.MailingStreet);
    }

    public static Map<Id, Boolean> checkBulkKYC(Set<Id> contactIds) {
        Map<Id, Boolean> result = new Map<Id, Boolean>();
        if (contactIds == null || contactIds.isEmpty()) return result;

        for (Contact c : [SELECT Id, Email, Phone, MailingStreet FROM Contact WHERE Id IN :contactIds]) {
            result.put(c.Id, isKYCComplete(c));
        }
        return result;
    }
}