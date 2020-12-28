import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/flights/search/bloc/flight_search_bloc.dart';
import 'package:raf_airlines_client/flights/search/results/flight_results_page.dart';
import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/ui/back_bar.dart';
import 'package:raf_airlines_client/ui/error_button_widget.dart';
import 'package:raf_airlines_client/ui/loading_icon.dart';

class FlightSearchPage extends StatefulWidget {
  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  final TextEditingController _startDestinationController = TextEditingController();
  final TextEditingController _endDestinationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  static final double maxDistance = 10000;
  static final double maxPrice = 2500;

  Airplane _selectedAirplane;

  RangeValues _selectedDistanceValues = RangeValues(0, maxDistance);
  RangeValues _selectedPriceValues = RangeValues(0, maxPrice);

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
              BlocConsumer<FlightSearchBloc, FlightSearchState>(listener: (context, state) {
                if (state is FlightSearchSuccessful)
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => FlightResultsPage(flights: state.flights)));
              }, builder: (context, state) {
                if (state is FlightSearchLoading)
                  return Expanded(child: LoadingIcon());
                else if (state is FlightSearchReady || state is FlightSearchSuccessful) {
                  List<Airplane> airplanes =
                      state is FlightSearchReady ? state.airplanes : (state as FlightSearchSuccessful).airplanes;
                  return Expanded(
                    child: ListView(
                      children: [
                        Text(
                          "Search flights",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Find the perfect flight just for you!",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "Destinations:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 32,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.flight_takeoff,
                                        color: Colors.grey,
                                        size: 28,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _startDestinationController,
                                          textCapitalization: TextCapitalization.characters,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              borderSide:
                                                  BorderSide(color: Theme.of(context).primaryColorDark, width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              borderSide: BorderSide(
                                                  color: Theme.of(context).primaryColor.withOpacity(0.5), width: 2),
                                            ),
                                            hintText: 'Start destination',
                                          ),
                                          maxLength: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.flight_land,
                                        color: Colors.grey,
                                        size: 28,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _endDestinationController,
                                          textCapitalization: TextCapitalization.characters,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              borderSide:
                                                  BorderSide(color: Theme.of(context).primaryColorDark, width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              borderSide: BorderSide(
                                                  color: Theme.of(context).primaryColor.withOpacity(0.5), width: 2),
                                            ),
                                            hintText: 'End destination',
                                          ),
                                          maxLength: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.filter_list_alt,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Filter:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 32,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.airplanemode_active,
                                      color: Colors.grey,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: DropdownButtonFormField<Airplane>(
                                        decoration: new InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                            borderSide: BorderSide(color: Theme.of(context).primaryColorDark, width: 2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                            borderSide: BorderSide(
                                                color: Theme.of(context).primaryColor.withOpacity(0.5), width: 2),
                                          ),
                                          hintText: 'Select airplane',
                                        ),
                                        isExpanded: true,
                                        onChanged: (selected) => setState(() => _selectedAirplane = selected),
                                        items: airplanes
                                            .map((airplane) =>
                                                DropdownMenuItem<Airplane>(value: airplane, child: Text(airplane.name)))
                                            .toList(),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Distance:",
                                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                        child: RangeSlider(
                                      values: _selectedDistanceValues,
                                      min: 0,
                                      max: maxDistance,
                                      divisions: 25,
                                      labels: RangeLabels(
                                        _selectedDistanceValues.start.round().toString() + " KM",
                                        _selectedDistanceValues.end.round().toString() + " KM",
                                      ),
                                      onChanged: (selected) => setState(() => _selectedDistanceValues = selected),
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Price:",
                                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                        child: RangeSlider(
                                      values: _selectedPriceValues,
                                      min: 0,
                                      max: maxPrice,
                                      divisions: 15,
                                      labels: RangeLabels(
                                        _selectedPriceValues.start.round().toString() + " EUR",
                                        _selectedPriceValues.end.round().toString() + " EUR",
                                      ),
                                      onChanged: (values) => setState(() => _selectedPriceValues = values),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        FloatingActionButton.extended(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            label: Text(
                              "Search",
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate())
                                BlocProvider.of<FlightSearchBloc>(context).add(FlightSearchParamsProvided(
                                    startDestination: _startDestinationController.text.toUpperCase(),
                                    endDestination: _endDestinationController.text.toUpperCase(),
                                    airplane: _selectedAirplane,
                                    minDistance: _selectedDistanceValues.start.toInt(),
                                    maxDistance: _selectedDistanceValues.end.toInt(),
                                    minPrice: _selectedPriceValues.start.toInt(),
                                    maxPrice: _selectedPriceValues.end.toInt()));
                            }),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  );
                } else {
                  return ErrorButtonWidget(
                      callback: () => BlocProvider.of<FlightSearchBloc>(context).add(FlightSearchInit()));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
