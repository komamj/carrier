import 'dart:io';

import 'package:carrier/domain/model/count.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  static const _baseUrl = "";

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
  }

  bool ok(Response response) {
    return response.statusCode == HttpStatus.ok;
  }

  Future<Count> getCount();
}
