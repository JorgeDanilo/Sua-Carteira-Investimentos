import 'package:sua_carteira_investimentos/core/app_result.dart';
import 'package:injectable/injectable.dart';
import 'package:sua_carteira_investimentos/domain/repository/repository.dart';
import 'package:sua_carteira_investimentos/domain/use_case/save_city_name_use_case.dart';

@injectable
@RegisterAs(GetWeatherByCityNameUseCase)
class GetWeatherByCityName implements GetWeatherByCityNameUseCase {
  final Repository repository;
  final SaveCityNameUseCase saveCityNameUseCase;
  GetWeatherByCityName(this.repository, this.saveCityNameUseCase);

  @override
  Future<AppResult> execute(String cityName) async {
    final response = await repository.getWeatherByCityName(cityName);
    response.mapSuccess((data) => saveCityNameUseCase.execute(cityName));
    return response;
  }

}

abstract class GetWeatherByCityNameUseCase {
  Future<AppResult> execute(String cityName);
}