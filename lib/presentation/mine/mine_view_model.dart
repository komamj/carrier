import 'package:carrier/domain/model/user.dart';
import 'package:carrier/domain/repository/mine_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class MineViewModel extends BaseViewModel {
  final MineRepository repository;
  String _name = "";
  String get name => _name;

  MineViewModel({required this.repository});

  void getUser() {
    repository.getUser().then((user) {
      if (user != null) {
        _name = user.nickName!;
        notifyListeners();
      }
    });
  }
}
