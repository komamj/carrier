import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/domain/model/count.dart';

import 'dart:core';

import 'package:dio/dio.dart';

class RemoteDataSourceImp extends RemoteDataSource {
  static const _count = "/v1/appHomePage/total"; // 首页各数量

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
}
