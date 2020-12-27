part of 'flight_search_bloc.dart';

abstract class FlightSearchEvent extends Equatable {
  const FlightSearchEvent();

  @override
  List<Object> get props => [];
}

class FlightSearchInit extends FlightSearchEvent {}

class FlightSearchParamsProvided extends FlightSearchEvent {
  final String startDestination;
  final String endDestination;

  final Airplane airplane;

  final int minDistance;
  final int maxDistance;

  final int minPrice;
  final int maxPrice;

  FlightSearchParamsProvided(
      {@required this.startDestination,
      @required this.endDestination,
      @required this.airplane,
      @required this.minDistance,
      @required this.maxDistance,
      @required this.minPrice,
      @required this.maxPrice});

  @override
  List<Object> get props => [
        startDestination,
        endDestination,
        airplane,
        minDistance,
        maxDistance,
        minPrice,
        maxPrice,
      ];
}
