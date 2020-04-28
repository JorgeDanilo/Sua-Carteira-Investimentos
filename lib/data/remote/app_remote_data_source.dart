import 'package:sua_carteira_investimentos/core/app_result.dart';
import 'package:sua_carteira_investimentos/data/mapper/remote_mapper.dart';
import 'package:sua_carteira_investimentos/data/remote/remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:sua_carteira_investimentos/data/response/weather_response.dart';
import 'package:sua_carteira_investimentos/data/service/remote_service.dart';
import 'package:sua_carteira_investimentos/domain/exception/app_exception.dart';

@injectable
@RegisterAs(RemoteDataSource)
class AppRemoteDataSource implements RemoteDataSource {
  final RemoteService _mockRemote;
  final RemoteService _remote;

  AppRemoteDataSource(
      @Named('mock') this._mockRemote,
      @Named('default') this._remote);

  @override
  Future<AppResult> getWeatherByCityName(String cityName) async {
    try {
      final response = ForecastResponse.fromJson(await _remote.getWeatherByCityName(cityName));
      return AppResult.success(mapForecastResponseToWeather(response));
    } on AppException catch(error) {
      return AppResult.failure(error.message);
    } catch(e) {
      return AppResult.failure();
    }
  }

}