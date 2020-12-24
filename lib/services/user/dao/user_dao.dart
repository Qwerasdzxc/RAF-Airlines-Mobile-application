import 'dart:async';

abstract class UserDAO {
  FutureOr<void> login(String email, String password);

  FutureOr<void> register(
      String name, String surname, String email, String password, String passport);
}
