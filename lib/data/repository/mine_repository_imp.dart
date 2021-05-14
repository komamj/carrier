import 'package:carrier/data/local/local_data_source.dart';
import 'package:carrier/data/local/local_data_source_imp.dart';
import 'package:carrier/domain/model/user.dart';
import 'package:carrier/domain/repository/mine_repository.dart';

class MineRepositoryImp extends MineRepository {
  static final MineRepositoryImp singleton = MineRepositoryImp.internal();

  LocalDataSource _localDataSource = LocalDataSourceImp.internal();

  factory MineRepositoryImp() {
    return singleton;
  }

  MineRepositoryImp.internal();

  @override
  Future<User?> getUser() {
    return _localDataSource.getUser();
  }
}
