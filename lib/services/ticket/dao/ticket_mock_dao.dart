import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/models/ticket.dart';
import 'package:raf_airlines_client/services/ticket/dao/ticket_dao.dart';

class TicketMockDAO implements TicketDAO {
  final tickets = [
    Ticket(
        id: 1,
        flight: Flight(
            id: 1,
            distance: 1690,
            airplane: Airplane(id: 1, capacity: 366, name: "Boeing 747"),
            startDestination: "BEG",
            endDestination: "LHR",
            price: 425,
            canceled: false),
        canceled: false,
        dayBought: DateTime.now()),
    Ticket(
        id: 2,
        flight: Flight(
            id: 2,
            distance: 1723,
            airplane: Airplane(id: 1, capacity: 366, name: "Boeing 747"),
            startDestination: "ZRH",
            endDestination: "LIS",
            price: 275,
            canceled: false),
        canceled: true,
        dayBought: DateTime.now().subtract(Duration(days: 7)))
  ];

  @override
  Future<List<Ticket>> getMyTickets() async {
    await Future.delayed(Duration(milliseconds: 500));

    return List.from(tickets);
  }
}
