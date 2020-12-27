import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/flights/search/bloc/flight_search_bloc.dart';
import 'package:raf_airlines_client/flights/search/flight_search_page.dart';
import 'package:raf_airlines_client/home/bloc/home_bloc.dart';
import 'package:raf_airlines_client/home/flight_card.dart';
import 'package:raf_airlines_client/home/ticket_card.dart';
import 'package:raf_airlines_client/services/airplane/airplane_service.dart';
import 'package:raf_airlines_client/services/flight/flight_service.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/ui/error_button_widget.dart';
import 'package:raf_airlines_client/ui/loading_icon.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(),
                        Row(
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.flight,
                              size: 32,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "RAF Airlines",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person),
                        )
                      ],
                    ),
                  ),
                  if (state is HomeLoading)
                    Expanded(
                        child: LoadingIcon(
                      text: "Loading flights...",
                    ))
                  else if (state is HomeLoaded)
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Hello,",
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Let's discover a new adventure!",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.view_carousel,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            "Your tickets:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 32,
                                    ),
                                    Expanded(
                                      child: state.tickets.isNotEmpty
                                          ? ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: state.tickets.length,
                                              itemBuilder: (BuildContext context, int index) => TicketCard(
                                                    ticket: state.tickets[index],
                                                  ))
                                          : Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.no_sim,
                                                  color: Colors.grey,
                                                  size: 36,
                                                ),
                                                Text(
                                                  "You don't have any active tickets",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 18),
                                                )
                                              ],
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 24,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Today's recommendations:",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    if (state.flights.isNotEmpty)
                                      InkWell(
                                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                            builder: (_) => BlocProvider<FlightSearchBloc>(
                                                  create: (_) => FlightSearchBloc(
                                                      airplaneService: getService<AirplaneService>(),
                                                      flightService: getService<FlightService>())
                                                    ..add(FlightSearchInit()),
                                                  child: FlightSearchPage(),
                                                ))),
                                        child: Text(
                                          "View all",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    child: state.flights.isNotEmpty
                                        ? ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state.flights.length,
                                            itemBuilder: (BuildContext context, int index) => FlightCard(
                                                  flight: state.flights[index],
                                                ))
                                        : Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.airplanemode_inactive,
                                                color: Colors.grey,
                                                size: 64,
                                              ),
                                              Text(
                                                "There are currently no available flights",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 18),
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  else
                    ErrorButtonWidget(callback: () => BlocProvider.of<HomeBloc>(context).add(HomeInit()))
                ],
              );
            }),
          ),
        ));
  }
}
