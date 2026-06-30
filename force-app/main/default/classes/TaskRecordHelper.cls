public class TaskRecordHelper {

    public static void beforeUpdate(List<Task> taskRecords){
        
        if(taskRecords.IsEmpty()){
	      return;
        }
        Set<Id> conIds = new Set<Id>();
        Map<Id,Id> taskToConMap = new Map<Id,Id>();
        
        for(Task ts : taskRecords){
            if(ts.whoId != null && String.valueOf(ts.whoId).startsWith('003')){
                conIds.add(ts.whoId);
                taskToConMap.put(ts.Id,ts.WhoId);
            }
        }
           if(conIds.isEmpty()){
            return;
              }
        
            List<Contact>conRecords = [SELECT AccountId From Contact WHERE Id IN : conIds];
        
            Set<Id> accIds = new Set<Id>();
            Map<Id,Id>conToAccMap = new Map<Id,Id>();
        
            if(!conRecords.isEmpty()){
                for(Contact con: conRecords){
                    accIds.add(con.AccountId);
                    conToAccMap.put(con.Id,con.AccountId);
                }        
          }
        
        if(accIds.isEmpty()){
            return;
        }
            Map<Id,Account> accMap = new Map<Id,Account>([SELECT Modify_Task_Permission__c 
                                                          FROM Account WHERE Id IN :accIds]);
           
            
        if(accMap.IsEmpty()) {
            return;
        }
            for(Task ts : taskRecords){
                if(taskToConMap.containskey(ts.Id)){
                    Id conId = taskToConMap.get(ts.Id);
                                                
                    if(conToAccMap.containsKey(conId)){
                    Id accId = conToAccMap.get(conId);
                
                   if(accMap.containsKey(accId)){
                       if(accMap.get(accId).Modify_Task_Permission__c == false){
                    ts.addError('you have not permisson to update task');
                }
               }  
              }  
             }
           }
        }
       }