import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/data/remote/remote_data_source_imp.dart';
import 'package:carrier/domain/model/count.dart';
import 'package:carrier/domain/repository/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  static final HomeRepositoryImp singleton = HomeRepositoryImp.internal();

  final RemoteDataSource _remoteDataSource = RemoteDataSourceImp.singleton;

  factory HomeRepositoryImp() {
    return singleton;
  }

  HomeRepositoryImp.internal();

  @override
  Future<Count> getCount() {
    return _remoteDataSource.getCount();
  }
}
