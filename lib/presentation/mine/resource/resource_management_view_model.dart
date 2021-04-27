import 'package:carrier/presentation/base/base_view_model.dart';
import 'package:flutter/foundation.dart';

class ResourceManagementViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool _isFirstLoading = true;

  bool get firstLoading => _isFirstLoading;

  void updateCurrentIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }

    debugPrint(
        "ResourceManagementViewModel updateCurrentIndex currentIndex:$currentIndex");
  }
}
