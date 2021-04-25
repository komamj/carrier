import 'package:carrier/domain/repository/user_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository repository;

  bool _savePassword = false;

  bool get savePassword => _savePassword;
  bool _showPassword = false;

  bool get showPassword => _showPassword;

  bool _isValid = false;

  bool get isValid => _isValid;

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
    // repository.isLogin();
    return true;
  }

  void checkUserName(String? userName) {}

  void checkPassword(String? password) {}

  void login(String? userName, String? password) {
    if (userName == null ||
        userName.isEmpty ||
        password == null ||
        password.isEmpty) {
      return;
    }
    repository.login(userName, password);
  }
}
