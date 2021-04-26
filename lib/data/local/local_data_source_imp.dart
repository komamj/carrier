import 'dart:convert';

import 'package:carrier/data/entities/user_response.dart';
import 'package:carrier/data/local/local_data_source.dart';
import 'package:carrier/presentation/util/constants.dart';
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

  @override
  Future<bool> saveUser(UserResponse userResponse) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
        Constants.KEY_USER, json.encode(userResponse));
  }

  @override
  Future<UserResponse?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user = sharedPreferences.getString(Constants.KEY_USER);
    if (user == null) {
      return null;
    } else {
      return json.decode(user);
    }
  }
}
