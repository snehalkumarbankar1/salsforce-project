trigger TransferAccountTrigger on Account (before insert) {

    if(Trigger.IsInsert && Trigger.IsBefore){
        
        User userDetails = [SELECT Id, UserName FROM User WHERE UserName =: System.Label.AccountToTransfer];
        
        for(Account accRecord : Trigger.New){
            
            if(accRecord.Rating == 'Hot' &&
               accRecord.AnnualRevenue > 5500000 &&
              accRecord.SLA__c == 'Platinum' && 
               accRecord.Active__c == 'Yes' &&
              userDetails.Id != null){
                   
                   accRecord.OwnerId = userDetails.Id;
               }
        }
         
    }
}