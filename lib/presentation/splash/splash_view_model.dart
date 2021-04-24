import 'package:carrier/domain/repository/splash_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  final SplashRepository repository;

  SplashViewModel({required this.repository});
}
