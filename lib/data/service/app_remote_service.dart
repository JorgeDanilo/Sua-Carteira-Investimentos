import 'package:sua_carteira_investimentos/core/constants.dart';
import 'package:sua_carteira_investimentos/data/http_manager/http_manager.dart';
import 'package:sua_carteira_investimentos/data/service/remote_service.dart';
import 'package:injectable/injectable.dart';

@injectable
@Named('default')
@RegisterAs(RemoteService)
class AppRemoteService implements RemoteService {
  final HttpManager httpManager;

  AppRemoteService(this.httpManager);

  @override
  Future getWeatherByCityName(String cityName) async => await httpManager.get(
      url: '/data/2.5/weather',
      query: {'d': cityName, 'apiKey': Constants.api_key});
}
