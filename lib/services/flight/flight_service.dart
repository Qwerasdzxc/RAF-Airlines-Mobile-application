import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';

import 'dao/flight_dao.dart';

class FlightService {
  final FlightDAO dao;

  FlightService({@required this.dao});

  Future<List<Flight>> getAvailableFlights() async => dao.getAvailableFlights();

  Future<List<Flight>> searchFlights({
    @required String startDestination,
    @required String endDestination,
    @required int minDistance,
    @required int maxDistance,
    @required int minPrice,
    @required int maxPrice,
    Airplane airplane,
  }) async =>
      dao.searchFlights(
          startDestination: startDestination,
          endDestination: endDestination,
          minDistance: minDistance,
          maxDistance: maxDistance,
          minPrice: minPrice,
          maxPrice: maxPrice,
          airplane: airplane);
}
