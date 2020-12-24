import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/models/tier.dart';

class User extends Equatable {

  final int id;
  final int miles;

  final String name;
  final String surname;
  final String email;
  final String passport;

  final Tier tier;

  User(
      {@required this.id,
      @required this.miles,
      @required this.name,
      @required this.surname,
      @required this.email,
      @required this.passport,
      @required this.tier});

  factory User.fromJson(Map json) => User(
      id: json["userId"],
      miles: json["miles"],
      name: json["name"],
      surname: json["surname"],
      email: json["email"],
      passport: json["passport"],
      tier: Tier.fromJson(json["tier"]));

  @override
  List<Object> get props => [id];
}
