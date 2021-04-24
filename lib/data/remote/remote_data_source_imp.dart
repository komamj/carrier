import 'dart:core';

import 'package:carrier/data/entities/user_request.dart';
import 'package:carrier/data/entities/user_response.dart';
import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/domain/model/count.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImp extends RemoteDataSource {
  static const _count = "/v1/appHomePage/total"; // 首页各数量
  static const String _login = "authcreate"; // 登录
  static const String _smsCode = "authnotcode"; // 发送验证码

  static final RemoteDataSourceImp singleton = RemoteDataSourceImp.internal();

  factory RemoteDataSourceImp() {
    return singleton;
  }

  RemoteDataSourceImp.internal();

  @override
  Future<Count> getCount() async {
    Response response = await client.get(_count);
    if (ok(response)) {
      dynamic result = await response.data;
      return Count.fromJson(result);
    }
    return new Count();
  }

  @override
  Future<UserResponse?> login(String phoneNumber, String password) async {
    UserRequest userRequest =
        UserRequest(phoneNumber: phoneNumber, password: password);
    Response response = await client.post(_login, data: userRequest.toJson());
    if (ok(response)) {
      dynamic result = await response.data;
      return UserResponse.fromJson(result);
    }
  }
}
