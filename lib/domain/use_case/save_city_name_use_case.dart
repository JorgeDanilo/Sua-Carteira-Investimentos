import 'package:injectable/injectable.dart';
import 'package:sua_carteira_investimentos/domain/repository/repository.dart';

@injectable
@RegisterAs(SaveCityNameUseCase)
class SaveCityName implements SaveCityNameUseCase {
  final Repository repository;
  SaveCityName(this.repository);

  @override
  void execute(String cityName) => repository.savedCityName(cityName);

}

abstract class SaveCityNameUseCase {
  void execute(String cityName);
}