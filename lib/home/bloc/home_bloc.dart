import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/models/ticket.dart';
import 'package:raf_airlines_client/services/flight/flight_service.dart';
import 'package:raf_airlines_client/services/ticket/ticket_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FlightService flightService;
  final TicketService ticketService;

  HomeBloc({@required this.ticketService, @required this.flightService}) : super(HomeLoading());

  int _currentPage = 1;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInit) {
      _currentPage = 1;
      yield HomeLoading();

      try {
        final tickets = await ticketService.getMyTickets();
        final flights = await flightService.getAvailableFlights(_currentPage);

        yield HomeLoaded(flights: flights, tickets: tickets);
        _currentPage += 1;
      } catch (_) {
        yield HomeError();
      }
    } else if (event is HomeTicketAdded) {
      HomeLoaded currState = state;
      yield HomeLoaded(
          flights: List.from(currState.flights)..removeWhere((flight) => flight.id == event.ticket.flight.id),
          tickets: List.from(currState.tickets)..add(event.ticket));
    } else if (event is HomeLoadMoreFlights) {
      HomeLoaded currState = state;
      yield HomeLoading();

      try {
        final flights = await flightService.getAvailableFlights(_currentPage);

        yield HomeLoaded(flights: List.from(currState.flights)..addAll(flights), tickets: currState.tickets);
        _currentPage += 1;
      } catch (_) {
        yield HomeError();
      }
    }
  }
}
