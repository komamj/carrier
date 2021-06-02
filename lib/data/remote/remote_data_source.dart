import 'dart:convert';
import 'dart:io';

import 'package:carrier/domain/model/count.dart';
import 'package:carrier/domain/model/user.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteDataSource {
  static const _baseUrl = "https://wx.51ejd.cn/";

  final Dio client = Dio(BaseOptions(
      baseUrl: _baseUrl, receiveTimeout: 1000 * 10, connectTimeout: 5000));

  RemoteDataSource() {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    client.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));

    _addHeaders();
  }

  void _addHeaders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? result = sharedPreferences.getString(Constants.KEY_USER);
    if (result != null) {
      User user = User.fromJson(json.decode(result));
      client.options.headers = {
        "Authorization": "${user.tokenType} ${user.accessToken}"
      };
    }
  }

  bool ok(Response response) {
    return response.statusCode == HttpStatus.ok;
  }

  Future<Count> getCount();

  Future<User?> login(String phoneNumber, String password);

  Future<bool?> authNotCode(String phoneNumber, String template);
}
