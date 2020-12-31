import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/services/airplane/airplane_service.dart';
import 'package:raf_airlines_client/services/flight/flight_service.dart';

part 'flight_search_event.dart';

part 'flight_search_state.dart';

class FlightSearchBloc extends Bloc<FlightSearchEvent, FlightSearchState> {
  final FlightService flightService;
  final AirplaneService airplaneService;

  FlightSearchBloc({@required this.flightService, @required this.airplaneService}) : super(FlightSearchLoading());

  @override
  Stream<FlightSearchState> mapEventToState(FlightSearchEvent event) async* {
    if (event is FlightSearchInit) {
      yield FlightSearchLoading();

      try {
        final airplanes = await airplaneService.getAllAirplanes();

        yield FlightSearchReady(airplanes: airplanes);
      } catch (_) {
        yield FlightSearchError();
      }
    } else if (event is FlightSearchParamsProvided) {
      List<Airplane> planes = state is FlightSearchReady
          ? (state as FlightSearchReady).airplanes
          : (state as FlightSearchSuccessful).airplanes;

      yield FlightSearchLoading();

      try {
        final flights = await flightService.searchFlights(event.startDestination, event.endDestination,
            event.minDistance, event.maxDistance, event.minPrice, event.maxPrice, event.airplane);

        yield FlightSearchSuccessful(airplanes: planes, flights: flights);
      } catch (e) {
        yield FlightSearchError();
      }
    }
  }
}
