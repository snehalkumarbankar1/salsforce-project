trigger AccountShareTrigger on Account (after insert) {

    List<AccountShare> accShares = new List<AccountShare>();
    
    if(Trigger.IsAfter && Trigger.IsInsert){
        for(Account accRecord : Trigger.New){
            
            if(accRecord.Active__c == 'yes' && accRecord.Share_Account_To__c != NULL){
                
                accountShare accShare = new accountShare();
                
                accShare.AccountId = accRecord.Id;
                accShare.UserOrGroupId = accRecord.Share_Account_To__c;
                
                if(accRecord.AnnualRevenue >= 5000000){
                    accShare.AccountAccessLevel = 'EDIT';
                }
                    else{
                        accShare.AccountAccessLevel = 'READ';
                         }
                
                accShare.OpportunityAccessLevel = 'READ';
                accShare.CaseAccessLevel = 'READ';
                accShare.RowCause = 'Manual';
                
                accShares.Add(accShare);
                
              }
        }
        
            if(!accShares.isEmpty())
            Insert accShares;
        }
    }