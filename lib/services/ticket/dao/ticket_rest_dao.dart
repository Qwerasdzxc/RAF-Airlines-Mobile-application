import 'package:raf_airlines_client/models/ticket.dart';
import 'package:raf_airlines_client/services/ticket/dao/ticket_dao.dart';

class TicketRestDAO implements TicketDAO {

  @override
  Future<List<Ticket>> getMyTickets() {
    throw UnimplementedError();
  }
}