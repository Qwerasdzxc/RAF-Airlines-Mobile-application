import 'dart:async';

import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';

abstract class FlightDAO {
  Future<List<Flight>> getAvailableFlights();

  Future<List<Flight>> searchFlights(String startDestination, String endDestination, int minDistance, int maxDistance,
      int minPrice, int maxPrice, Airplane airplane);
}
