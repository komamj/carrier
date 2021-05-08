import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/data/remote/remote_data_source_imp.dart';
import 'package:carrier/domain/repository/mine_repository.dart';

class MineRepositoryImp extends MineRepository {
  static final MineRepositoryImp singleton = MineRepositoryImp.internal();

  RemoteDataSource _remoteDataSource = RemoteDataSourceImp.internal();

  factory MineRepositoryImp() {
    return singleton;
  }

  MineRepositoryImp.internal();
}
