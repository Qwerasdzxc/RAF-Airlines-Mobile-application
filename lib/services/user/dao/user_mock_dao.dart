import 'dart:async';

import 'package:raf_airlines_client/models/tier.dart';
import 'package:raf_airlines_client/models/user.dart';
import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/services/user/dao/user_dao.dart';

class UserMockDAO implements UserDAO {
  @override
  FutureOr<void> login(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    if (email != "client@raf-airlines.com" || password != "pAsSwOrD") throw NetworkException();
  }

  @override
  FutureOr<void> register(String name, String surname, String email, String password, String passport) async {
    // Anything the user provides will be considered as a success
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  FutureOr<void> updateProfile(String name, String surname, String email, String passport) async {
    // Anything the user provides will be considered as a success
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  Future<User> getMyProfile() async {
    await Future.delayed(Duration(milliseconds: 500));

    return User(
        id: 1,
        miles: 1250,
        name: "Luka",
        surname: "Petrovic",
        email: "petrovic.luka99@gmail.com",
        passport: "123456789",
        tier: Tier(id: 1, threshold: 2500, name: "Silver"));
  }

  @override
  FutureOr<void> updatePassword(String currentPassword, String newPassword) async {
    // Anything the user provides will be considered as a success
    await Future.delayed(Duration(milliseconds: 500));
  }
}
