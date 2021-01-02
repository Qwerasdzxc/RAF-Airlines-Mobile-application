import 'dart:async';

import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/network/rest_client.dart';
import 'package:raf_airlines_client/services/flight/dao/flight_dao.dart';

class FlightRestDAO implements FlightDAO {
  @override
  Future<List<Flight>> getAvailableFlights(int page) async {
    try {
      List<Flight> flights = await RestClient().getAvailableFlights(page);
      return flights;
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Flight>> searchFlights(String startDestination, String endDestination, int minDistance, int maxDistance,
      int minPrice, int maxPrice, Airplane airplane) async {
    try {
      List<Flight> flights = await RestClient()
          .searchFlights(startDestination, endDestination, minDistance, maxDistance, minPrice, maxPrice, airplane);
      return flights;
    } on NetworkException catch (e) {
      throw e;
    }
  }
}
