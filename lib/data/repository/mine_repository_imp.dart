import 'package:carrier/data/local/local_data_source.dart';
import 'package:carrier/data/local/local_data_source_imp.dart';
import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/data/remote/remote_data_source_imp.dart';
import 'package:carrier/domain/model/user.dart';
import 'package:carrier/domain/repository/mine_repository.dart';

class MineRepositoryImp extends MineRepository {
  static final MineRepositoryImp singleton = MineRepositoryImp.internal();

  RemoteDataSource _remoteDataSource = RemoteDataSourceImp.internal();
  LocalDataSource _localDataSource = LocalDataSourceImp.internal();

  factory MineRepositoryImp() {
    return singleton;
  }

  MineRepositoryImp.internal();

  @override
  Future<User?> getUser() {
    return _localDataSource.getUser();
  }

  @override
  Future<bool?> authNotCode(String phoneNumber, String template) async {
    bool? res = await _remoteDataSource.authNotCode(phoneNumber, template);
    return res;
  }
}
