public class DynamicPatternMatches {

    public static void searchLeadRecords(String searchContent){
        
        if(searchContent != null && searchContent != ''){
            
            String leadQuery = 'SELECT Id,FirstName, LastName, Email, Fax, Status,Rating,Phone FROM Lead';
            
            if(Pattern.Matches('[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}',searchContent)){
               
                leadQuery += ' WHERE Email =: searchContent';
                system.debug('this is email id');
            }
            else {
                  searchContent += '%';
                leadQuery += ' WHERE LastName LIKE : searchContent';
                system.debug('this is normal string');
            }
           List<Lead> lstLeads = Database.Query(leadQuery);
            system.debug('number of lead records are'+ lstLeads.Size());
            if(!lstLeads.isEmpty()){
                
                for(Lead ld : lstLeads){
                    system.debug('lead Records are...'+ ld);
                }
            }
        }
    }
}