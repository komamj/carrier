abstract class UserRepository {
  void login(String userName, String password);

  Future<bool> isLogin();
}
