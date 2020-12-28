import 'package:flutter/material.dart';
import 'package:raf_airlines_client/flights/search/results/flight_result_item.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/ui/back_bar.dart';

class FlightResultsPage extends StatelessWidget {
  final List<Flight> flights;

  const FlightResultsPage({Key key, @required this.flights}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              BackBar(),
              Expanded(
                  child: ListView(
                children: <Widget>[
                      Text(
                        flights.length > 1 ? "${flights.length} flights found" : "1 flight found",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ] +
                    flights.map((flight) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: FlightResultItem(flight: flight),
                    )).toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
