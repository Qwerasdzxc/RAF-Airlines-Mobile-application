import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CreditCard extends Equatable {

  final String number;

  final int ccv;

  CreditCard({@required this.number, @required this.ccv});

  factory CreditCard.fromJson(Map json) => CreditCard(number: json["number"], ccv: json["ccv"]);

  @override
  List<Object> get props => [number, ccv];
}
