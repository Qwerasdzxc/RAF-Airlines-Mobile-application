import 'package:raf_airlines_client/models/ticket.dart';

abstract class TicketDAO {

  Future<List<Ticket>> getMyTickets();
}