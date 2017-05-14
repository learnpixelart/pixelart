import React from 'react';


export default class WeatherDisplay extends React.Component {

  constructor() {
    super();
    this.state = {
      weatherData: null
    };
  }

  componentDidMount() {
    const {q, data} = this.props;

    let URL;
    // check if q is present e.g. a string (e.g. is NOT undefined)
    if( typeof q === 'string' ) {
      // note: https NOT supported by api service; for HTTPS use "cached" version (see below)
      URL = "http://api.openweathermap.org/data/2.5/weather?q=" +
        q +
        "&appid=b1b35bba8b434a28a0be2a3e1071ae5b&units=metric";
    } else {
      // use cached version on github
      URL = "https://raw.githubusercontent.com/playhtml/weather/master/data/" +
        data +
        ".json"
    }


    fetch(URL)
      .then(res => res.json())
      .then(json => {
         this.setState({ weatherData: json });
      });
  }

  render() {
    const weatherData = this.state.weatherData;
    if (!weatherData) return <div>Loading...</div>;

    const weather = weatherData.weather[0];
    const iconUrl = "https://openweathermap.org/img/w/" + weather.icon + ".png";
    return(
  <div>
    <h1>
      {weather.main} in {weatherData.name}
      <img src={iconUrl} alt={weatherData.description} />
    </h1>
    <p>Current: {weatherData.main.temp} °C</p>
    <p>High: {weatherData.main.temp_max} °C</p>
    <p>Low: {weatherData.main.temp_min} °C</p>
    <p>Wind Speed: {weatherData.wind.speed} km/h</p>
  </div>
);
  }
}  // class WeatherDisplay
