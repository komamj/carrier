import 'package:carrier/domain/repository/home_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  int _toBeDeterminedCount = 0;

  int get toBeDeterminedCount => _toBeDeterminedCount;

  int _inTheSchedulingCount = 0;

  int get inTheSchedulingCount => _inTheSchedulingCount;

  int _inTransitCount = 0;

  int get inTransitCount => _inTransitCount;

  final HomeRepository repository;

  HomeViewModel({required this.repository});

  void updateCurrentIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }

    debugPrint("HomeViewModel updateCurrentIndex index:$index");
  }

  void refreshCount() {
    repository.getCount().then((count) {
      _toBeDeterminedCount = count.toBeDeterminedCount;
      _inTheSchedulingCount = count.inTheSchedulingCount;
    }).catchError((error) {
      debugPrint("refresh count error $error");
    });
  }
}
