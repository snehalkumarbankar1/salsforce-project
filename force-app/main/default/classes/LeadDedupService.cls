public class LeadDedupService {
        public static List<Lead> removeDuplicateEmails(List<Lead> leads)
        { 
            list<Lead>uniqueld = new list<Lead>();
            
            Set<String> emailset = new Set<String>();
            
            if(leads == null || leads.isEmpty())
            {
                return uniqueld; 
            }
       
            for(Lead ld : leads){
                if(ld.Email != null && !emailset.contains(ld.Email)){
                    emailset.add(ld.Email);
                          uniqueld.add(ld);
                }
            }
            return uniqueld;
        }
}