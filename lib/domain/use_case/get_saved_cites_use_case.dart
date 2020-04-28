import 'package:injectable/injectable.dart';
import 'package:sua_carteira_investimentos/domain/repository/repository.dart';

@injectable
@RegisterAs(GetSavesCities)
class GetSavesCities implements GetSavesCitiesUseCase {
  final Repository repository;
  GetSavesCities(this.repository);

  @override
  List<String> execute() => repository.getCityNames();

}

abstract class GetSavesCitiesUseCase {
  List<String> execute();
}