import 'dart:async';

import 'package:raf_airlines_client/models/credit_card.dart';
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
  FutureOr<void> register(String name, String surname, String email, String password, String passport) async {
    try {
      await RestClient().register(name, surname, email, password, passport);
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  FutureOr<void> updateProfile(String name, String surname, String email, String passport) async {
    try {
      await RestClient().updateProfile(name, surname, email, passport);
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  Future<User> getMyProfile() async {
    try {
      User user = await RestClient().getMyProfile();
      return user;
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  FutureOr<void> updatePassword(String currentPassword, String newPassword) async {
    try {
      await RestClient().updatePassword(currentPassword, newPassword);
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  Future<List<CreditCard>> getMyCreditCards() async {
    try {
      List<CreditCard> creditCards = await RestClient().getMyCreditCards();
      return creditCards;
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  FutureOr<void> deleteCreditCard(CreditCard creditCard) async {
    try {
      await RestClient().deleteCreditCard(creditCard);
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  Future<CreditCard> addCreditCard(CreditCard creditCard) async {
    try {
      CreditCard result = await RestClient().addCreditCard(creditCard);
      return result;
    } on NetworkException catch (e) {
      throw e;
    }
  }
}
