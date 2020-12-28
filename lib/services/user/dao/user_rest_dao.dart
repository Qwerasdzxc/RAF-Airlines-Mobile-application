import 'dart:async';

import 'package:raf_airlines_client/models/user.dart';
import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/network/rest_client.dart';
import 'package:raf_airlines_client/services/user/dao/user_dao.dart';

class UserRestDAO implements UserDAO {
  @override
  FutureOr<void> login(String email, String password) async {
    try {
      await RestClient().login(email, password);
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  FutureOr<void> register(
      String name, String surname, String email, String password, String passport) {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> updateProfile(String name, String surname, String email, String passport) {
    throw UnimplementedError();
  }

  @override
  Future<User> getMyProfile() {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> updatePassword(String currentPassword, String newPassword) {
    throw UnimplementedError();
  }
}
