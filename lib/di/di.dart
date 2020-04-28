
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sua_carteira_investimentos/di/di.iconfig.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => $initGetIt(getIt());