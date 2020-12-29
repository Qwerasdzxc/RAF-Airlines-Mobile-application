import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/models/user.dart';
import 'package:raf_airlines_client/services/user/dao/user_dao.dart';

class UserService {
  final UserDAO dao;

  UserService({@required this.dao});

  FutureOr<void> login(String email, String password) async => dao.login(email, password);

  FutureOr<void> register(String name, String surname, String email, String password, String passport) async =>
      dao.register(name, surname, email, password, passport);

  FutureOr<void> updateProfile(String name, String surname, String email, String passport) async =>
      dao.updateProfile(name, surname, email, passport);

  Future<User> getMyProfile() async => dao.getMyProfile();

  FutureOr<void> updatePassword(String currentPassword, String newPassword) async =>
      dao.updatePassword(currentPassword, newPassword);

  Future<List<CreditCard>> getMyCreditCards() async => dao.getMyCreditCards();

  FutureOr<void> deleteCreditCard(CreditCard creditCard) async => dao.deleteCreditCard(creditCard);

  Future<CreditCard> addCreditCard(CreditCard creditCard) async => dao.addCreditCard(creditCard);
}
