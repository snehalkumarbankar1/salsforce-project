@RestResource(URLMapping='/BulkRecordInsertion/*')
Global class LeadBulkHelper {
@HttpPost()
    Global static String insertBulkLead(){
        String leadRecord =RestContext.request.requestbody.ToString();
       List<Lead> lstleads = (List<Lead>) JSON.deserialize(leadRecord,List<Lead>.class);
        if(!lstleads.isEmpty()){
            insert lstleads;
            return 'Record succefull';
        }
        else{
            return 'Record Failed';
        }
    }
}