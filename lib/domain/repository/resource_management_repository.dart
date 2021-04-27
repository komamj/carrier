import 'package:carrier/domain/model/count.dart';

abstract class ResourceManagementRepository {
  Future<Count> getCount();
}
