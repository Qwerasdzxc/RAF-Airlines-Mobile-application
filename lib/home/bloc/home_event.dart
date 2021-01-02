part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInit extends HomeEvent {}

class HomeLoadMoreFlights extends HomeEvent {}

class HomeTicketAdded extends HomeEvent {

  final Ticket ticket;

  HomeTicketAdded({@required this.ticket});

  @override
  List<Object> get props => [ticket];
}