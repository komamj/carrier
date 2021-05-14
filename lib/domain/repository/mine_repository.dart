import 'package:carrier/domain/model/user.dart';

abstract class MineRepository {
  Future<User?> getUser();
}
