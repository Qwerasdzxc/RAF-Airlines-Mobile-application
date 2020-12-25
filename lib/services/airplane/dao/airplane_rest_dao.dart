import 'dart:async';

import 'package:raf_airlines_client/models/airplane.dart';

import 'airplane_dao.dart';

class AirplaneRestDAO implements AirplaneDAO {

  @override
  Future<List<Airplane>> getAllAirplanes() {
    throw UnimplementedError();
  }
}