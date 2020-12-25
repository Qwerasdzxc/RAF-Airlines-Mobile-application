import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:raf_airlines_client/models/flight.dart';

class Ticket extends Equatable {
  final int id;

  final Flight flight;

  final bool canceled;

  final DateTime dayBought;

  Ticket({this.id, @required this.flight, @required this.canceled, @required this.dayBought});

  factory Ticket.fromJson(Map json) => Ticket(
      id: json["ticketId"],
      flight: Flight.fromJson(json["flight"]),
      canceled: json["canceled"],
      dayBought: DateTime.parse(json["dayBought"]));

  @override
  List<Object> get props => [id];
}
