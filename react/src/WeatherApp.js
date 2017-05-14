import React from 'react';

import WeatherDisplay from './WeatherDisplay';



const PLACES = [
  { name: "Vienna, Austria",       q: "Vienna,at" },
  { name: "London, Great Britain", q: "London,gb" },
  { name: "Mexico City, Mexico",   q: "Mexico+City,mx" },
  { name: "Washington, U.S.A.",    q: "Washington,us" },
  { name: "Tehran, Iran",          q: "Tehran,ir" }
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
          q={PLACES[activePlace].q}
        />
      </div>
    );
  }
}
