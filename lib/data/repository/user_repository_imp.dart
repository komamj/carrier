import 'package:carrier/data/local/local_data_source.dart';
import 'package:carrier/data/local/local_data_source_imp.dart';
import 'package:carrier/data/remote/remote_data_source.dart';
import 'package:carrier/data/remote/remote_data_source_imp.dart';
import 'package:carrier/domain/model/user.dart';
import 'package:carrier/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserRepositoryImp extends UserRepository {
  static final UserRepositoryImp singleton = UserRepositoryImp.internal();

  RemoteDataSource _remoteDataSource = RemoteDataSourceImp.internal();
  LocalDataSource _localDataSource = LocalDataSourceImp.internal();

  factory UserRepositoryImp() {
    return singleton;
  }

  UserRepositoryImp.internal();

  @override
  Future<User?> login(String phoneNumber, String password) async {
    User? user = await _remoteDataSource.login(phoneNumber, password);
    if (user != null) {
      user.phoneNumber = phoneNumber;
      user.password = password;
      await _localDataSource.saveUser(user);
    }
    return user;
  }

  @override
  Future<bool> isLogin() async {
    return _localDataSource.isLogin();
  }
}
