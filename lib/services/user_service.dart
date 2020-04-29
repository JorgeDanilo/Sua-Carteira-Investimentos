import 'package:sua_carteira_investimentos/dao/user_dao.dart';
import 'package:sua_carteira_investimentos/model/user.dart';
import 'package:sua_carteira_investimentos/services/base_service.dart';

class UserService extends BaseService<User> {

  UserDAO _dao;

  UserService() {
    this._dao = new UserDAO();
  }

  @override
  bool validate(User entity) {
    return (entity.name.isNotEmpty && entity.email.isNotEmpty && entity.password.isNotEmpty);
  }

  Future<int> save(User entity) {
    if (validate(entity))
      return _dao.save(entity);
  }



}