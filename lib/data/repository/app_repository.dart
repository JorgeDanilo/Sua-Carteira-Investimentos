import 'package:sua_carteira_investimentos/core/app_result.dart';
import 'package:sua_carteira_investimentos/data/local/local_data_source.dart';
import 'package:sua_carteira_investimentos/data/remote/remote_data_source.dart';
import 'package:sua_carteira_investimentos/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(Repository)
class AppRepository implements Repository {

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AppRepository(this.remoteDataSource, this.localDataSource);

  @override
  List<String> getCityNames() => localDataSource.getCityNames();

  @override
  Future<AppResult> getWeatherByCityName(String cityName) => remoteDataSource.getWeatherByCityName(cityName);

  @override
  void savedCityName(String cityName) => localDataSource.saveCityName(cityName);

}