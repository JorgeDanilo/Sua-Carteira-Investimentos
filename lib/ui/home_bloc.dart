import 'package:sua_carteira_investimentos/core/app_result.dart';
import 'package:sua_carteira_investimentos/core/app_state.dart';
import 'package:sua_carteira_investimentos/core/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sua_carteira_investimentos/domain/use_case/get_saved_cites_use_case.dart';
import 'package:sua_carteira_investimentos/domain/use_case/get_wather_by_city_name_use_case.dart';

@injectable
class HomeBloc extends Bloc {
  final GetWeatherByCityNameUseCase _getWeatherUseCase;
  final GetSavesCitiesUseCase _getSavesCitiesUseCase;

  HomeBloc(this._getWeatherUseCase, this._getSavesCitiesUseCase);

  void getListOfSavedCites() {
    streamController.sink.add(OnGetSavedCites(_getSavesCitiesUseCase.execute()));
  }

  void onGetWeatherByCityName(String cityName) async {
    streamController.sink.add(Loading());
    final response = await _getWeatherUseCase.execute(cityName);
    switch(response.status) {
      case Status.SUCCESS:
        getListOfSavedCites();
        streamController.sink.add(Success(response.data));
        break;
      case Status.FAILURE:
        streamController.sink.add(Failure(response.message));
        break;
    }
  }

}

abstract class HomeState extends AppState {}

class OnGetSavedCites extends HomeState {
  List<String> cities;
  OnGetSavedCites(this.cities);
}