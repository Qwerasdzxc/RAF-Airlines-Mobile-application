import 'dart:async';
import 'dart:math';

import 'package:raf_airlines_client/models/airplane.dart';

import 'airplane_dao.dart';


class AirplaneMockDAO implements AirplaneDAO {

  final List<Airplane> planes = [
    Airplane(id: 1, capacity: 366, name: "Boeing 747"),
    Airplane(id: 2, capacity: 242, name: "Boeing 787")
  ];

  @override
  Future<List<Airplane>> getAllAirplanes() async {
    await Future.delayed(Duration(milliseconds: 500));

    return List.from(planes);
  }
}