import 'package:carrier/config/config.dart';
import 'package:carrier/domain/repository/mine_repository.dart';
import 'package:carrier/presentation/base/base_view_model.dart';

class MineViewModel extends BaseViewModel {
  final MineRepository repository;
  String aliOssUrl =
      'https://my-oss-bucket-epressarrive0c7c7eb2-959e-47f7-83a5-91a2559bd416.oss-cn-beijing.aliyuncs.com';
  String _avatar =
      "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f";
  String get avatar => _avatar;
  String _name = "";
  String get name => _name;
  String _mobile = "";
  String get mobile => _mobile;
  String _companyName = "";
  String get companyName => _companyName;
  MineViewModel({required this.repository});

  void getUser() {
    repository.getUser().then((user) {
      if (user != null) {
        _avatar =
            user.avatar != null ? aliOssUrl + '/roadExample.png' : AVATARDEF;
        _name = user.nickName!;
        _mobile = user.phoneNumber!;
        _companyName = user.organizationName!;
        notifyListeners();
      }
    });
  }
}
