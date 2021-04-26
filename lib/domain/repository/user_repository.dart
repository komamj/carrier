abstract class UserRepository {
  Future login(String phoneNumber, String password);

  Future<bool> isLogin();
}
