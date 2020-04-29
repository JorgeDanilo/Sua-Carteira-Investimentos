import 'package:sua_carteira_investimentos/model/base_model.dart';

abstract class Entity extends BaseModel<int> {

  Map<String, dynamic> toMap();
}
