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

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInit) {

    }
  }
}
