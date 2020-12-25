import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raf_airlines_client/models/flight.dart';

import 'dao/flight_dao.dart';

class FlightService {

  final FlightDAO dao;

  FlightService({@required this.dao});

  Future<List<Flight>> getAvailableFlights() async => dao.getAvailableFlights();
}