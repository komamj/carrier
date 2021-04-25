import 'package:carrier/presentation/base/base_view_model.dart';
import 'package:flutter/material.dart';

class MineViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateCurrentIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }

    debugPrint("HomeViewModel updateCurrentIndex index:$index");
  }

}
