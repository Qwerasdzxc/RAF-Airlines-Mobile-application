import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';

import 'dao/flight_dao.dart';

class FlightService {
  final FlightDAO dao;

  FlightService({@required this.dao});

  Future<List<Flight>> getAvailableFlights(int page) async => dao.getAvailableFlights(page);

  Future<List<Flight>> searchFlights(
    String startDestination,
    String endDestination,
    int minDistance,
    int maxDistance,
    int minPrice,
    int maxPrice,
    Airplane airplane,
  ) async =>
      dao.searchFlights(startDestination, endDestination, minDistance, maxDistance, minPrice, maxPrice, airplane);
}
