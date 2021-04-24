import 'package:carrier/domain/repository/splash_repository.dart';

class SplashRepositoryImp extends SplashRepository {
  static final SplashRepositoryImp singleton = SplashRepositoryImp.internal();

  factory SplashRepositoryImp() {
    return singleton;
  }

  SplashRepositoryImp.internal();
}
