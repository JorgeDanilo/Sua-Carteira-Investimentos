import 'package:sua_carteira_investimentos/core/app_result.dart';

abstract class Repository {
  Future<AppResult> getWeatherByCityName(String cityName);
  void savedCityName(String cityName);
  List<String> getCityNames();
}