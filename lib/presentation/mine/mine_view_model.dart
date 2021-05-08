import 'package:carrier/data/local/local_data_source.dart';
import 'package:carrier/data/local/local_data_source_imp.dart';
import 'package:carrier/domain/model/user.dart';
import 'package:carrier/domain/repository/mine_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class MineViewModel extends BaseViewModel {
  LocalDataSource _localDataSource = LocalDataSourceImp.internal();
  final MineRepository repository;
  MineViewModel({required this.repository});

  Future<User?> getUser() async {
    return await _localDataSource.getUser();
  }
}
