import 'dart:async';

import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/network/rest_client.dart';

import 'airplane_dao.dart';

class AirplaneRestDAO implements AirplaneDAO {

  @override
  Future<List<Airplane>> getAllAirplanes() async {
    try {
      List<Airplane> airplanes = await RestClient().getAllAirplanes();
      return airplanes;
    } on NetworkException catch (e) {
      throw e;
    }
  }
}