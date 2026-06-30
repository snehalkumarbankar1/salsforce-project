public with sharing class ContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getRecords(String inputValue){
         List<Contact> result = [
    SELECT Id, FirstName, LastName, Email, Phone
    FROM Contact
    WHERE Email LIKE :('%' + inputValue + '%')
       OR Phone LIKE :('%' + inputValue + '%')
];

       return result;
    }
}