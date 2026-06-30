public class dynamicSOQLqueryDemo {
    public static void mymethod(List<String>fieldNames, String ObjName){
        if(fieldNames == null || fieldNames.isEmpty() || String.isBlank(ObjName)){
            return;
        }
        String strQuery = 'Select Id';
        for(String str : fieldNames){
            strQuery += ' , '+ str;
        }
        strQuery += ' From '+ ObjName;
        System.debug(strQuery);
        
        List<SObject>lstSObj = Database.query(strQuery);
        system.debug(lstSObj);
        
    }
    }
/* Execution - List<String> lstfieldNames = new list<String>{'name','Rating','AnnualRevenue','Phone','Type'};
    String strObjName = 'Account'; 
dynamicSOQLqueryDemo.mymethod(lstfieldNames,strObjName);*/