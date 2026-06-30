public class learnIntegrationApex {
 
    public static void makeCallout(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=15daef7b6851476681f307cd3ef1b55b');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('made a callout to External system'+response.getStatusCode());
        if(response.getStatusCode()==200){
            system.debug('made a callout to External system'+response.getBody());
        }
    }
}