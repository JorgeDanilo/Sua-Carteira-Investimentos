import 'package:sua_carteira_investimentos/data/response/weather_response.dart';
import 'package:sua_carteira_investimentos/domain/model/weather.dart';

Weather mapForecastResponseToWeather(ForecastResponse response) => Weather(
    description: response.weather.first.description,
    feelsLike: response.main.feelsLike,
    main: response.weather.first.main,
    temp: response.main.temp);
