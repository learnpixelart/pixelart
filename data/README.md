# Weather Sample Data


Example queries include:

- London, Great Britain (e.g. London,gb)
- Vienna, Austria     (e.g. Vienna,at)
- Mexico City, Mexico (e.g. Mexico+City,mx)
- Washington, U.S.A.  (e.g. Washington,us)
- Tehran, Iran        (e.g. Tehran,ir)


Source: OpenWeatherMap API

```
http://api.openweathermap.org/data/2.5/weather?q=<query>&appid=<appid>&units=metric
```

To fetch (cached local) data use:

```
https://raw.githubusercontent.com/playhtml/weather/master/data/<query>.json e.g.
https://raw.githubusercontent.com/playhtml/weather/master/data/vienna_at.json
```
