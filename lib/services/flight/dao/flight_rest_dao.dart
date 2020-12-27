import 'dart:async';

import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/services/flight/dao/flight_dao.dart';

class FlightRestDAO implements FlightDAO {
  @override
  Future<List<Flight>> getAvailableFlights() {
    throw UnimplementedError();
  }

  @override
  Future<List<Flight>> searchFlights({String startDestination, String endDestination, int minDistance, int maxDistance, int minPrice, int maxPrice, Airplane airplane}) {
    throw UnimplementedError();
  }
}
