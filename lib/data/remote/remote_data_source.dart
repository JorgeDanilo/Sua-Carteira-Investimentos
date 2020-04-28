import 'package:sua_carteira_investimentos/core/app_result.dart';

abstract class RemoteDataSource {
  Future<AppResult> getWeatherByCityName(String cityName);
}