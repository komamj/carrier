import 'package:carrier/data/local/local_data_source.dart';
import 'package:carrier/data/local/local_data_source_imp.dart';
import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/data/remote/remote_data_source_imp.dart';
import 'package:carrier/domain/repository/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  static final UserRepositoryImp singleton = UserRepositoryImp.internal();

  RemoteDataSource _remoteDataSource = RemoteDataSourceImp.internal();
  LocalDataSource _localDataSource = LocalDataSourceImp.internal();

  factory UserRepositoryImp() {
    return singleton;
  }

  UserRepositoryImp.internal();

  @override
  Future login(String phoneNumber, String password) async {
    return null;
  }

  @override
  Future<bool> isLogin() async {
    return _localDataSource.isLogin();
  }
}
