import 'dart:async';

import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/services/user/dao/user_dao.dart';

class UserMockDAO implements UserDAO {
  @override
  FutureOr<void> login(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    if (email != "client@raf-airlines.com" || password != "pAsSwOrD") throw NetworkException();
  }

  @override
  FutureOr<void> register(
      String name, String surname, String email, String password, String passport) async {
    // Anything the user provides will be considered as a success
    await Future.delayed(Duration(milliseconds: 500));
  }
}
