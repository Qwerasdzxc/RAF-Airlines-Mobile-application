part of 'flight_details_bloc.dart';

abstract class FlightDetailsState extends Equatable {
  const FlightDetailsState();
}

class FlightDetailsInitial extends FlightDetailsState {
  @override
  List<Object> get props => [];
}
