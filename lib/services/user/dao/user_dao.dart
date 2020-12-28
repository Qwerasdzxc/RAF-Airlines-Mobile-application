import 'dart:async';

import 'package:raf_airlines_client/models/user.dart';

abstract class UserDAO {
  FutureOr<void> login(String email, String password);

  FutureOr<void> register(
      String name, String surname, String email, String password, String passport);

  FutureOr<void> updateProfile(String name, String surname, String email, String passport);

  Future<User> getMyProfile();

  FutureOr<void> updatePassword(String currentPassword, String newPassword);

  Future<List<CreditCard>> getMyCreditCards();
}
