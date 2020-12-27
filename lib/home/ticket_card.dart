import 'package:flutter/material.dart';
import 'package:raf_airlines_client/models/ticket.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({Key key, @required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.flight_takeoff,
                    color: Colors.grey,
                    size: 28,
                  ),
                  Text(
                    ticket.flight.startDestination,
                    style: TextStyle(fontSize: 18, color: Colors.blue[800], fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.flight_land,
                    color: Colors.grey,
                    size: 28,
                  ),
                  Text(
                    ticket.flight.endDestination,
                    style: TextStyle(fontSize: 18, color: Colors.orange[800], fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                height: 28,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.airplanemode_active,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Plane:  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ticket.flight.airplane.name,
                    style: TextStyle(color: Colors.teal[800], fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.announcement,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Status:  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ticket.canceled ? "Canceled" : "Active",
                    style: TextStyle(
                        color: ticket.canceled ? Colors.red[800] : Colors.green[800], fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
