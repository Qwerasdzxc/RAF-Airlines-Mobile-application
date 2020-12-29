import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Tier extends Equatable {

  final int id;
  final int threshold;

  final double salePercentage;

  final String name;

  Tier({@required this.id, @required this.threshold, @required this.salePercentage, @required this.name});

  factory Tier.fromJson(Map json) =>
      Tier(id: json["id"], threshold: json["threshold"], salePercentage: json["salePercentage"], name: json["name"]);

  @override
  List<Object> get props => [id];
}
