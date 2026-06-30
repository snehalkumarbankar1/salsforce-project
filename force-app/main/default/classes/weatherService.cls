public with sharing class weatherService {

    @AuraEnabled(cacheable=true)
    public static String getWeatherInfo(String cityName) {

        if(String.isBlank(cityName)) {
            throw new AuraHandledException('City name is required');
        }

        String endpoint =
            System.Label.weatherEndpointURL+cityName + '&appid=' + System.Label.applicationId;

        Http http = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint(endpoint);
        req.setMethod('GET');
       
        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){
            return res.getBody();
        }
         else{
            throw new AuraHandledException('Unable to fetch weather data');
        }
    }
}