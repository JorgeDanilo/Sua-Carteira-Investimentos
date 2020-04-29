import 'package:sua_carteira_investimentos/model/user.dart';
import 'package:sua_carteira_investimentos/services/user_service.dart';

class UserBloc {

  Future<int> save(User user) {
    var userService = UserService();
    return userService.save(user);
  }
}