part of 'flight_search_bloc.dart';

abstract class FlightSearchState extends Equatable {
  const FlightSearchState();

  @override
  List<Object> get props => [];
}

class FlightSearchReady extends FlightSearchState {

  final List<Airplane> airplanes;

  FlightSearchReady({@required this.airplanes});

  @override
  List<Object> get props => [airplanes];
}

class FlightSearchLoading extends FlightSearchState {}

class FlightSearchSuccessful extends FlightSearchState {

  final List<Airplane> airplanes;
  final List<Flight> flights;

  FlightSearchSuccessful({@required this.airplanes, @required this.flights});

  @override
  List<Object> get props => [flights];
}

class FlightSearchError extends FlightSearchState {}