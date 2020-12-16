import 'dart:async';

import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/network/rest_client.dart';
import 'package:raf_airlines_client/services/user/dao/user_dao.dart';

class UserRestDAO implements UserDAO {
  @override
  FutureOr<void> login(String email, String password) {
    try {
      RestClient().login(email, password);
    } on NetworkException catch (e) {
      print(e?.cause);
      throw e;
    }
  }
}