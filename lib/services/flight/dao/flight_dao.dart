import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';

abstract class FlightDAO {
  Future<List<Flight>> getAvailableFlights();

  Future<List<Flight>> searchFlights({
    @required String startDestination,
    @required String endDestination,
    @required int minDistance,
    @required int maxDistance,
    @required int minPrice,
    @required int maxPrice,
    Airplane airplane,
  });
}
