part of 'new_ticket_bloc.dart';

abstract class NewTicketState extends Equatable {
  const NewTicketState();

  @override
  List<Object> get props => [];
}

class NewTicketInitial extends NewTicketState {

  final User profile;

  NewTicketInitial({@required this.profile});

  @override
  List<Object> get props => [profile];
}

class NewTicketLoading extends NewTicketState {}

class NewTicketReceived extends NewTicketState {

  final Ticket ticket;

  NewTicketReceived({@required this.ticket});

  @override
  List<Object> get props => [ticket];
}

class NewTicketError extends NewTicketState {}

class NewTicketDone extends NewTicketState {}