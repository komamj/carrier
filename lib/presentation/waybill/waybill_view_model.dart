import 'package:carrier/domain/repository/waybill_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class WaybillViewModel extends BaseViewModel {
  bool _isFirstLoading = true;

  bool get firstLoading => _isFirstLoading;

  final WaybillRepository repository;

  WaybillViewModel({required this.repository});

  void loadWaybill() async {
    Future.delayed(Duration(milliseconds: 3000), () {
      _isFirstLoading = false;
      notifyListeners();
    });
  }
}
