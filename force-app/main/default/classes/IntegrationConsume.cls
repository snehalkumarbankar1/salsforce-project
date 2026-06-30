public class IntegrationConsume {

    public static void callout(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
       req.setEndpoint('callout:SF_name/services/apexrest/DataAvailable/');
        req.setMethod('GET');
        HttpResponse res = http.send(req); 
         
System.debug('Status Code = ' + res.getStatusCode());
        if(res.getStatusCode()==200){
            system.debug('make callout'+res.getBody());
        }
        
    }
}