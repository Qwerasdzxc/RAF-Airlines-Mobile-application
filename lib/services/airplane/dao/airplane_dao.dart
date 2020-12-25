import 'dart:async';

import 'package:raf_airlines_client/models/airplane.dart';

abstract class AirplaneDAO {

  Future<List<Airplane>> getAllAirplanes();
}