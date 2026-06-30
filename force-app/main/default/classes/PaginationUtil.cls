public class PaginationUtil {

    public static List<Account> getAccountPage(Integer pageSize, Integer pageNumber){
        if(pageSize == null || pageNumber == null || pageSize <= 0 || pageNumber <= 0){
            return new List <Account>();
        }
           Integer offsetValue = (pageNumber-1)*pageSize;
        
        List<Account> lstAcc = [SELECT Id, Name, Industry FROM Account ORDER BY Name
                                LIMIT : pageSize OFFSET :offsetValue];
        return lstAcc;
    }
}