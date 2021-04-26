import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/data/remote/remote_data_source_imp.dart';
import 'package:carrier/domain/repository/waybill_repository.dart';

class WaybillRepositoryImp extends WaybillRepository {
  static final WaybillRepositoryImp singleton = WaybillRepositoryImp.internal();

  RemoteDataSource _remoteDataSource = RemoteDataSourceImp.internal();

  factory WaybillRepositoryImp() {
    return singleton;
  }

  WaybillRepositoryImp.internal();
}
