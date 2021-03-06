import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/models/ticket.dart';
import 'package:raf_airlines_client/services/ticket/dao/ticket_dao.dart';

class TicketService {
  final TicketDAO dao;

  TicketService({@required this.dao});

  Future<List<Ticket>> getMyTickets() async => dao.getMyTickets();

  Future<Ticket> buyTicket(CreditCard creditCard, Flight flight) async => dao.buyTicket(creditCard, flight);
}
