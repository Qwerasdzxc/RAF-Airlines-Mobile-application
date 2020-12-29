import 'dart:async';

import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/models/tier.dart';
import 'package:raf_airlines_client/models/user.dart';
import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/services/user/dao/user_dao.dart';

class UserMockDAO implements UserDAO {
  final List<CreditCard> _crediCards = [
    CreditCard(number: "1234 5678 9101 2345", ccv: 123),
    CreditCard(number: "9876 5432 1098 7654", ccv: 987),
  ];

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
        tier: Tier(id: 1, threshold: 2500, name: "Silver", salePercentage: 20));
  }

  @override
  FutureOr<void> updatePassword(String currentPassword, String newPassword) async {
    // Anything the user provides will be considered as a success
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  Future<List<CreditCard>> getMyCreditCards() async {
    await Future.delayed(Duration(milliseconds: 500));

    return List.from(_crediCards);
  }

  @override
  FutureOr<void> deleteCreditCard(CreditCard creditCard) async {
    await Future.delayed(Duration(milliseconds: 500));

    _crediCards.remove(creditCard);
  }

  @override
  Future<CreditCard> addCreditCard(CreditCard creditCard) async {
    await Future.delayed(Duration(milliseconds: 500));

    _crediCards.add(creditCard);

    return _crediCards.last;
  }
}
