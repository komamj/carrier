import 'package:carrier/domain/model/user.dart';
import 'package:carrier/domain/repository/user_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class UserViewModel extends BaseViewModel {
  static const _error = "账号或密码错误，请重新登录";
  static const _successful = "登录成功";

  final UserRepository repository;

  bool _isValid = false;

  bool get isValid => _isValid;

  bool _isValidPhoneNumber = false;
  bool _isValidPassword = false;

  bool _savePassword = true;

  bool get savePassword => _savePassword;

  bool _showPassword = false;

  bool get showPassword => _showPassword;

  UserViewModel({required this.repository});

  Future<User> getUser() async {
    User? user = await repository.getUser();
    if (user == null) {
      user = new User(phoneNumber: "", password: "");
    } else {
      user = User(phoneNumber: user.phoneNumber, password: user.password);
    }
    return user;
  }

  void updateSavePassword(bool newValue) {
    if (_savePassword != newValue) {
      _savePassword = newValue;
      notifyListeners();
    }
  }

  void updateShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  Future<bool> isLogin() async {
    return await repository.isLogin();
  }

  void checkUserName(String? userName) {}

  void checkPassword(String? password) {}

  /// 测试账号:13555555223 密码：ds123456
  Future<bool> login(String? phoneNumber, String? password) async {
    if (phoneNumber == null ||
        phoneNumber.isEmpty ||
        password == null ||
        password.isEmpty) {
      return true;
    }
    return repository.login(phoneNumber, password).then((user) {
      return user != null;
    });
  }
}
