public class FutureApex {
  @future(callout=true)
    public static void futureCallout(List<Id>accIds){
        if(accIds.size()>0){
            for(Account acc : [SELECT Id,Name,Phone FROM Account WHERE Id IN :accIds]){
                Http http = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndPoint('callout:SF_name/services/apexrest/DataAvailable?phn='+acc.Phone);
                HttpResponse res = http.send(req);
                system.debug('status code is'+res.getStatusCode());
                if(res.getStatusCode()==200){
                    system.debug(res.getBody());
                }
            }
        }
    }
}