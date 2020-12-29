import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/models/ticket.dart';

abstract class TicketDAO {

  Future<List<Ticket>> getMyTickets();
  
  Future<Ticket> buyTicket(Flight flight);
}