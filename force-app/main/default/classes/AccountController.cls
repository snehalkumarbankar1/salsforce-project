public with sharing class AccountController {
    @AuraEnabled
    public static void createAccount(String accountName) {
        insert new Account(Name = accountName);

    }
}