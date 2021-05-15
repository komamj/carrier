import 'package:carrier/domain/model/user.dart';

abstract class UserRepository {
  Future<User?> login(String phoneNumber, String password);

  Future<bool> isLogin();

  Future<User?> getUser();
}
