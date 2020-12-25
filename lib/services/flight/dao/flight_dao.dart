import 'dart:async';

import 'package:raf_airlines_client/models/flight.dart';

abstract class FlightDAO {
  Future<List<Flight>> getAvailableFlights();
}