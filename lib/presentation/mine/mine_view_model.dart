import 'package:carrier/config/config.dart';
import 'package:carrier/domain/model/user.dart';
import 'package:carrier/domain/repository/mine_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class MineViewModel extends BaseViewModel {
  final MineRepository repository;
  String aliOssUrl =
      'https://my-oss-bucket-epressarrive0c7c7eb2-959e-47f7-83a5-91a2559bd416.oss-cn-beijing.aliyuncs.com';

  MineViewModel({required this.repository});

  Future<User> getUser() async {
    User? user = await repository.getUser();
    if (user == null) {
      user = new User(
          nickName: "", phoneNumber: "", avatar: "", organizationName: "");
    } else {
      user = User(
          nickName: user.nickName,
          phoneNumber: user.phoneNumber,
          avatar:
              user.avatar != null ? aliOssUrl + '/roadExample.png' : AVATARDEF,
          organizationName: user.organizationName);
    }
    return user;
  }

  /// 测试账号:18380479234
  Future<bool> authNotCode(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return true;
    }
    return repository.authNotCode(phoneNumber, "SMS_156625001").then((user) {
      return user != null;
    });
  }
}
