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

  bool isLogin() {
    return true;
  }

  void checkUserName(String? userName) {}

  void checkPassword(String? password) {}

  Future login(String? phoneNumber, String? password) async {
    if (phoneNumber == null ||
        phoneNumber.isEmpty ||
        password == null ||
        password.isEmpty) {
      return;
    }
    return repository.login(phoneNumber, password);
  }
}
