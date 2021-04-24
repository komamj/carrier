import 'package:carrier/data/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceImp extends LocalDataSource {
  static final LocalDataSourceImp singleton = LocalDataSourceImp.internal();

  factory LocalDataSourceImp() {
    return singleton;
  }

  LocalDataSourceImp.internal();

  @override
  Future<bool> isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? result = sharedPreferences.getBool("key");
    if (result == null) {
      return false;
    } else {
      return result;
    }
  }
}
