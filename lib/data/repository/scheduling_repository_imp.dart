import 'package:carrier/domain/repository/scheduling_repository.dart';

class SchedulingRepositoryImp extends SchedulingRepository {
  static final SchedulingRepositoryImp singleton =
      SchedulingRepositoryImp.internal();

  factory SchedulingRepositoryImp() {
    return singleton;
  }

  SchedulingRepositoryImp.internal();
}
