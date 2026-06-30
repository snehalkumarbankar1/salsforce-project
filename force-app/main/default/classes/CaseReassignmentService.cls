public class CaseReassignmentService {
    
    public class UserNotFoundException extends Exception {}
    
    public static void reassignCasesToUser(Set<Id> caseIds, String username){
        
        if(caseIds == null && caseIds.isEmpty()){
            return;
        }
        user u;
        List<user> users = [SELECT Id, Username FROM user WHERE Username= :username LIMIT 1];
        
        if(users.isEmpty()){
            throw new UserNotFoundException('user not found with username..:'+username);
            
        }
        u = users[0];
        
        List<Case> casesToUpdate =[SELECT Id, Subject, OwnerId FROM Case WHERE Id IN: caseIds];
        
        for(case cs : casesToUpdate){
            cs.OwnerId = u.Id;
        }
        update casesToUpdate;
    }

}