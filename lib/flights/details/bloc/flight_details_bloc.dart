import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'flight_details_event.dart';
part 'flight_details_state.dart';

class FlightDetailsBloc extends Bloc<FlightDetailsEvent, FlightDetailsState> {
  FlightDetailsBloc() : super(FlightDetailsInitial());

  @override
  Stream<FlightDetailsState> mapEventToState(
    FlightDetailsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
