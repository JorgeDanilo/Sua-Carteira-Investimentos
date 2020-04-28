import 'package:sua_carteira_investimentos/core/app_result.dart';
import 'package:sua_carteira_investimentos/data/remote/remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:sua_carteira_investimentos/data/service/remote_service.dart';

@injectable
@RegisterAs(RemoteDataSource)
class AppRemoteDataSource implements RemoteDataSource {
  final RemoteService _mockRemote;
  final RemoteService _remote;

  AppRemoteDataSource(
      @Named('mock') this._mockRemote,
      @Named('default') this._remote);

  @override
  Future<AppResult> getWeatherByCityName(String cityName) {
    try {
      //final response = ForecasResponse.from
    } catch(error) {

    }
  }

}