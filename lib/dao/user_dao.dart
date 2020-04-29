import 'package:sua_carteira_investimentos/db/base_dao.dart';
import 'package:sua_carteira_investimentos/model/user.dart';

class UserDAO extends BaseDAO<User> {

  @override
  String get tableName => "user";

  @override
  User fromMap(Map<String, dynamic> map) {
    return User.fromMap(map);
  }

}