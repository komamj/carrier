import 'package:carrier/domain/model/user.dart';

abstract class LocalDataSource {
  Future<bool> isLogin();

  Future<bool> saveUser(User user);

  Future<User?> getUser();
}
