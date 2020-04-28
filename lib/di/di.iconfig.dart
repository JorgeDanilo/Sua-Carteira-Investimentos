// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sua_carteira_investimentos/data/http_manager/app_http_manager.dart';
import 'package:sua_carteira_investimentos/data/http_manager/http_manager.dart';
import 'package:sua_carteira_investimentos/data/service/app_remote_service.dart';
import 'package:sua_carteira_investimentos/data/service/remote_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sua_carteira_investimentos/di/di_module.dart';
import 'package:sua_carteira_investimentos/data/remote/app_remote_data_source.dart';
import 'package:sua_carteira_investimentos/data/remote/remote_data_source.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final serviceModule = _$ServiceModule();
  g.registerFactory<HttpManager>(() => AppHttpManager());
  g.registerFactory<RemoteService>(() => AppRemoteService(g<HttpManager>()),
      instanceName: 'default');
  final sharedPreferences = await serviceModule.dio;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerFactory<RemoteDataSource>(() => AppRemoteDataSource(
      g<RemoteService>('mock'),
      g<RemoteService>('default')));
}

class _$ServiceModule extends ServiceModule {}
