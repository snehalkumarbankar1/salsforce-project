trigger AccountTriggerHandler on Account (after update) {
    List<Id>accountIds = new List<Id>();
    for(Account acc : Trigger.new){
        Account oldAcc = Trigger.oldMap.get(acc.Id);
        if(acc.Phone != oldAcc.Phone){
          accountIds.add(acc.Id);   
        }
    }
    FutureApex.futureCallout(accountIds);
}