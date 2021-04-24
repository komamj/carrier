import 'package:carrier/domain/repository/user_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository repository;

  UserViewModel({required this.repository});

  bool isLogin() {
    return true;
  }
}
