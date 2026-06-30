import { LightningElement, track } from 'lwc';

import getWeather from '@salesforce/apex/weatherService.getWeatherInfo';

export default class WeatherApp extends LightningElement {

    cityName = '';

    @track city;
    @track temperature;
    @track humidity;

    handleChange(event){
        this.cityName = event.target.value;
    }

    getWeatherData(){

        getWeather({ cityName : this.cityName })

        .then(result => {
  console.log(' data'+ result);

            let data = JSON.parse(result);

            console.log('data response'+ data);

            this.city = data.name;
            this.temperature = data.main.temp;
            // temperature is in Kelvin, convert to Celsius if needed
            this.temperature = (data.main.temp - 273.15).toFixed(2);
            this.humidity = data.main.humidity;

        })

        .catch(error => {

            console.error(error);

        });
    }
}