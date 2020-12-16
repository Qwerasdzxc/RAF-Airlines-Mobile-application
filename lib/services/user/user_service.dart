import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/services/user/dao/user_dao.dart';

class UserService {

  final UserDAO dao;

  UserService({@required this.dao});

  FutureOr<void> login(String email, String password) async => dao.login(email, password);
}