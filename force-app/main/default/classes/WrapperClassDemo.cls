public class WrapperClassDemo
{
    public demoInnerClass fetchaccopp(String nameVal){
         nameVal = '%'+nameVal+'%';
        list<Account> acc = [SELECT Id,Name FROM Account WHERE Name LIKE:nameVal LIMIT 100];
        list<Opportunity> opp = [SELECT id,Name FROM Opportunity WHERE Name LIKE:nameVal LIMIT 100];
        
        demoInnerClass combinedRecord = new demoInnerClass(acc,opp);
        return combinedrecord;
    }

    public class demoInnerClass
    {
        public list<Account> accList{get;set;}
        public list<Opportunity> opplist{get;set;}
        public demoInnerClass(List<Account>acc, List<Opportunity>opp){
            oppList = opp;
            accList = acc;
        }
        
    }
}