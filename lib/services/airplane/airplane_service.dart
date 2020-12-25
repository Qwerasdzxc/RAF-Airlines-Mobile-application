import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raf_airlines_client/models/airplane.dart';

import 'dao/airplane_dao.dart';

class AirplaneService {

  final AirplaneDAO dao;

  AirplaneService({@required this.dao});

  Future<List<Airplane>> getAllAirplanes() async => dao.getAllAirplanes();
}