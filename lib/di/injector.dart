import 'package:carrier/data/repository/home_repository.dart';
import 'package:carrier/data/repository/scheduling_repository_imp.dart';
import 'package:carrier/data/repository/splash_repository_imp.dart';
import 'package:carrier/data/repository/user_repository_imp.dart';
import 'package:carrier/domain/repository/home_repository.dart';
import 'package:carrier/domain/repository/scheduling_repository.dart';
import 'package:carrier/domain/repository/splash_repository.dart';
import 'package:carrier/domain/repository/user_repository.dart';

class Injector {
  static final Injector singleton = Injector.internal();

  factory Injector() {
    return singleton;
  }

  Injector.internal();

  SplashRepository provideSplashRepository() {
    return SplashRepositoryImp.internal();
  }

  UserRepository provideUserRepository() {
    return UserRepositoryImp.internal();
  }

  HomeRepository provideHomeRepository() {
    return HomeRepositoryImp.internal();
  }

  SchedulingRepository provideSchedulingRepository() {
    return SchedulingRepositoryImp.internal();
  }
}
