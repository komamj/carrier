import 'package:carrier/data/entities/user_response.dart';

abstract class LocalDataSource {
  Future<bool> isLogin();

  Future<bool> saveUser(UserResponse userResponse);

  Future<UserResponse?> getUser();
}
