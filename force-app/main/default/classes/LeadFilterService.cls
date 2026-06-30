public class LeadFilterService
{
   public static List<Lead> getOpenLeadsByCompanyKeyword(String keyword)
   {
       if(keyword == null || keyword == '')
       { return new List<Lead>();
       }
          String likekeyword = '%' + keyword +'%';
          List<Lead>lsthotld = [SELECT ID,Name, Company, Status ,Rating, Email FROM Lead WHERE Status = 'Open - Not Contacted' AND
                                                                           Company LIKE :likekeyword ];
            System.debug('size of list'+ lsthotld.Size());
                         
               for(Lead ld : lsthotld)
               {
                   System.debug('lead records are'+ ld);
               }
               return lsthotld;
           }
   
   }