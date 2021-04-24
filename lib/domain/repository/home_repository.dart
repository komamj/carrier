import 'package:carrier/domain/model/count.dart';

abstract class HomeRepository {
  Future<Count> getCount();
}
