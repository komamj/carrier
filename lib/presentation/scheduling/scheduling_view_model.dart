import 'package:carrier/domain/repository/scheduling_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';
import 'package:flutter/foundation.dart';

class SchedulingViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  int _toBeDeterminedCount = 0;

  int get toBeDeterminedCount => _toBeDeterminedCount;

  int _inTheSchedulingCount = 0;

  int get inTheSchedulingCount => _inTheSchedulingCount;

  int _inTransitCount = 0;

  int get inTransitCount => _inTransitCount;

  final SchedulingRepository repository;

  SchedulingViewModel({required this.repository});

  void updateCurrentIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }

    debugPrint(
        "SchedulingViewModel updateCurrentIndex currentIndex:$currentIndex");
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty("toBeDeterminedCount", toBeDeterminedCount));
    properties.add(IntProperty("inTheSchedulingCount", inTheSchedulingCount));
    properties.add(IntProperty("inTransitCount", inTransitCount));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
