part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {

  final List<Flight> flights;
  final List<Ticket> tickets;

  HomeLoaded({@required this.flights, @required this.tickets});

  @override
  List<Object> get props => [flights, tickets];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}
