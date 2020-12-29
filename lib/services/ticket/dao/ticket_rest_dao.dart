import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/models/ticket.dart';
import 'package:raf_airlines_client/network/network_exception.dart';
import 'package:raf_airlines_client/network/rest_client.dart';
import 'package:raf_airlines_client/services/ticket/dao/ticket_dao.dart';

class TicketRestDAO implements TicketDAO {
  @override
  Future<List<Ticket>> getMyTickets() async {
    try {
      List<Ticket> tickets = await RestClient().getMyTickets();
      return tickets;
    } on NetworkException catch (e) {
      throw e;
    }
  }

  @override
  Future<Ticket> buyTicket(CreditCard creditCard, Flight flight) async {
    try {
      Ticket ticket = await RestClient().buyTicket(creditCard, flight);
      return ticket;
    } on NetworkException catch (e) {
      throw e;
    }
  }
}
