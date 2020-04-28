import 'package:sua_carteira_investimentos/data/local/local_data_source.dart';
import 'package:sua_carteira_investimentos/data/storage/storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(LocalDataSource)
class AppLocalDataSource implements LocalDataSource {
  final Storage storage;

  AppLocalDataSource(this.storage);

  @override
  List<String> getCityNames() => storage.getCityNames();

  @override
  void saveCityName(String cityName) => storage.saveCityNam(cityName);

}