part of 'new_ticket_bloc.dart';

abstract class NewTicketEvent extends Equatable {
  const NewTicketEvent();

  @override
  List<Object> get props => [];
}

class NewTicketSubmitted extends NewTicketEvent {

  final Flight flight;

  NewTicketSubmitted({@required this.flight});

  @override
  List<Object> get props => [flight];
}

class NewTicketInit extends NewTicketEvent {}