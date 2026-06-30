public with sharing class CustomSalesOrderDetailsController {
    @AuraEnabled
    public static Sales_Customer__c getCustomerData(String sPhone , String sEmail){
        try {
            Sales_Customer__c SC =[SELECT Id,Name,Primary_Phone__c,Email__c,Address__c FROM Sales_Customer__c WHERE 
                                               Primary_Phone__c =:sPhone OR Email__c =:sEmail];
                             return SC;                  
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Sales_Order__c> getSalesOrderData(String sCustomerId){
        try {
            List<Sales_Order__c> SOlist = [SELECT Name,Id,Order_Date__c,Total_Items__c,Total_Quantity__c,
                                 Total_Amount__c,(SELECT Id, Product_Name__c, Quantity__c, Discount__c FROM Sales_Order_Line_Items__r)
                                            FROM Sales_Order__c WHERE Customer__c =:sCustomerId];
                                 return SOlist;            
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}