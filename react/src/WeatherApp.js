import React from 'react';

import WeatherDisplay from './WeatherDisplay';



const PLACES = [
  { name: "Vienna, Austria",       q: "Vienna,at",       data: "vienna_at" },
  { name: "London, Great Britain", q: "London,gb",       data: "london_gb" },
  { name: "Mexico City, Mexico",   q: "Mexico+City,mx",  data: "mexico_city_mx" },
  { name: "Washington, U.S.A.",    q: "Washington,us",   data: "washington_us" },
  { name: "Tehran, Iran",          q: "Tehran,ir",       data: "tehran_ir" }
];


export default class WeatherApp extends React.Component {

constructor() {
  super();
  this.state = {
    activePlace: 0,
  };
}

  render() {

   const activePlace = this.state.activePlace;

  //  NOTE: for weatherdisplay use
  //    q={PLACES[activePlace].q          => live fetching (only works w/ HTTP)  -or-
  //    data=={PLACES[activePlace].data   => cached version from /data folder via GitHub

    return(
      <div>
        {PLACES.map((place, index) => (
         <button
          key={index}
          onClick={() => {
            this.setState({ activePlace: index });
          }}
         >
          {place.name}
        </button>
        ))}
        <WeatherDisplay
          key={activePlace}
          data={PLACES[activePlace].data} />
      </div>
    );
  }
}
