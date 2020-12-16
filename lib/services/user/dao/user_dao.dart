import 'dart:async';

abstract class UserDAO {

  FutureOr<void> login(String email, String password);
}