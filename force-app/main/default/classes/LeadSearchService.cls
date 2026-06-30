public class LeadSearchService {
    
    public static List<Lead> searchLeads(String rating, String status, String companyKeyword){
      
        String ldQuery = 'SELECT Id,Name, Rating, Status, Company FROM Lead';
        
        List<String> conditions = new List<String>();
        
        if(!String.isBlank(rating)){
            conditions.add('Rating = :rating');
        }
        if(!String.isBlank(status)){
            conditions.add('Status = :status');
        }
        if(!String.isBlank(companyKeyword)){
           conditions.add('Company LIKE \'%' + String.escapeSingleQuotes(companyKeyword) + '%\'');
        }
        if(!conditions.isEmpty()){
            ldQuery += ' WHERE ' + String.join(conditions,' AND ');
        }  
        return Database.query(ldQuery);
    }
}