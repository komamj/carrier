import 'package:carrier/data/local/local_data_source.dart';
import 'package:carrier/data/local/local_data_source_imp.dart';
import 'package:carrier/domain/repository/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  static final UserRepositoryImp singleton = UserRepositoryImp.internal();

  LocalDataSource _localDataSource = LocalDataSourceImp.internal();

  factory UserRepositoryImp() {
    return singleton;
  }

  UserRepositoryImp.internal();

  @override
  void login(String userName, String password) {}

  @override
  Future<bool> isLogin() async {
    return _localDataSource.isLogin();
  }
}
