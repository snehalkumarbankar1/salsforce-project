public class CovidData {
    public static void getCovidData(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://api.rootnet.in/covid19-in/stats/latest');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        system.debug('make callout status'+ res.getStatusCode());
        if(res.getStatusCode() == 200){
            system.debug('make callout succefull'+ res.getBody());
        }
        
        
    }
}