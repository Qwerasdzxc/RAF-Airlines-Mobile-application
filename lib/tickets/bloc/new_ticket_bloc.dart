import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:raf_airlines_client/home/bloc/home_bloc.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/models/ticket.dart';
import 'package:raf_airlines_client/models/user.dart';
import 'package:raf_airlines_client/services/ticket/ticket_service.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

part 'new_ticket_event.dart';
part 'new_ticket_state.dart';

class NewTicketBloc extends Bloc<NewTicketEvent, NewTicketState> {

  final UserService userService;
  final TicketService ticketService;
  final HomeBloc homeBloc;

  NewTicketBloc({@required this.userService, @required this.ticketService, @required this.homeBloc}) : super(NewTicketLoading());

  @override
  Stream<NewTicketState> mapEventToState(NewTicketEvent event) async* {
    if (event is NewTicketInit) {
      yield NewTicketLoading();

      try {
        final profile = await userService.getMyProfile();

        yield NewTicketInitial(profile: profile);
      } catch (_) {
        yield NewTicketError();
      }
    } else if (event is NewTicketSubmitted) {
      yield NewTicketLoading();

      try {
        final ticket = await ticketService.buyTicket(event.flight);

        yield NewTicketReceived(ticket: ticket);
        homeBloc.add(HomeTicketAdded(ticket: ticket));

        await Future.delayed(Duration(seconds: 1));

        yield NewTicketDone();
      } catch (_) {
        yield NewTicketError();
      }
    }
  }
}
