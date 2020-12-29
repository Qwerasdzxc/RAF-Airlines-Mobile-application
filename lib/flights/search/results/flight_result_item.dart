import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/home/bloc/home_bloc.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/services/ticket/ticket_service.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';
import 'package:raf_airlines_client/tickets/bloc/new_ticket_bloc.dart';
import 'package:raf_airlines_client/tickets/new_ticket_dialog.dart';
import 'package:raf_airlines_client/ui/clipper/ticket_clipper.dart';

class FlightResultItem extends StatelessWidget {
  final Flight flight;

  const FlightResultItem({Key key, @required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(bottomClip: true, radius: 15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.flight,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Flight",
                    style:
                        TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " with ${flight.airplane.name}",
                    style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.flight_takeoff,
                      color: Colors.grey,
                      size: 28,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      flight.startDestination,
                      style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: DottedDecoration(shape: Shape.line, linePosition: LinePosition.bottom),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      flight.endDestination,
                      style: TextStyle(color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.flight_land,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: Colors.grey,
                              size: 26,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Distance: ",
                                style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "${flight.distance} KM",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: Colors.grey,
                              size: 26,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Price: ",
                                style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "${flight.price} EUR",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Buy ticket",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                        ),
                        builder: (_) => BlocProvider<NewTicketBloc>(
                            lazy: false,
                            create: (_) => NewTicketBloc(
                                userService: getService<UserService>(),
                                ticketService: getService<TicketService>(),
                                homeBloc: BlocProvider.of<HomeBloc>(context))
                              ..add(NewTicketInit()),
                            child: NewTicketDialog(
                              flight: flight,
                            ))),
                  ),
                  SizedBox(
                    width: 12,
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
