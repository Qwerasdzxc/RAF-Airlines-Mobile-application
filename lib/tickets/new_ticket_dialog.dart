import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/tickets/bloc/new_ticket_bloc.dart';
import 'package:raf_airlines_client/ui/error_button_widget.dart';
import 'package:raf_airlines_client/ui/loading_icon.dart';

class NewTicketDialog extends StatefulWidget {
  final Flight flight;

  const NewTicketDialog({Key key, @required this.flight}) : super(key: key);

  @override
  _NewTicketDialogState createState() => _NewTicketDialogState();
}

class _NewTicketDialogState extends State<NewTicketDialog> {
  final _formKey = GlobalKey<FormState>();

  CreditCard _selectedCreditCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 48.0),
                  child: Text("Buy ticket",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600, color: Theme.of(context).primaryColorDark))),
              Container()
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPadding(
                duration: Duration(milliseconds: 250),
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "RAF Airlines",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Passenger service",
                                style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColorDark),
                              ),
                            ],
                          )),
                          Expanded(child: Container()),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.75,
                            width: double.maxFinite,
                            child: Center(
                              child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 150),
                                  child: BlocConsumer<NewTicketBloc, NewTicketState>(
                                    listener: (context, state) {
                                      if (state is NewTicketDone) Navigator.of(context).pop();
                                    },
                                    builder: (context, state) {
                                      if (state is NewTicketLoading)
                                        return LoadingIcon();
                                      else if (state is NewTicketInitial)
                                        return Padding(
                                          padding: const EdgeInsets.all(24),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
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
                                                    widget.flight.startDestination,
                                                    style: TextStyle(
                                                        color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          Container(
                                                            decoration: DottedDecoration(
                                                                shape: Shape.line, linePosition: LinePosition.bottom),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.flight.endDestination,
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold),
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
                                              Divider(
                                                height: 24,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_rounded,
                                                    color: Colors.grey,
                                                    size: 26,
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text("Distance: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.bold)),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    "${widget.flight.distance} KM",
                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.attach_money,
                                                    color: Colors.grey,
                                                    size: 26,
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text("Price: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.bold)),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    "${widget.flight.price} EUR",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        decoration: TextDecoration.lineThrough),
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.grey,
                                                    size: 26,
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    "${widget.flight.price - (widget.flight.price * state.profile.tier.salePercentage / 100)} EUR",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.card_giftcard,
                                                    color: Colors.grey,
                                                    size: 26,
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text("Sale: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.bold)),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    "${state.profile.tier.salePercentage} %",
                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    color: Colors.grey,
                                                    size: 26,
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text("Passenger: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.bold)),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    "${state.profile.name} ${state.profile.surname}",
                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.assignment_ind_sharp,
                                                    color: Colors.grey,
                                                    size: 26,
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text("Passport number: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.bold)),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    "${state.profile.passport}",
                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Form(
                                                key: _formKey,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.credit_card,
                                                      color: Colors.grey,
                                                      size: 26,
                                                    ),
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    Text("Credit card: ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                            fontWeight: FontWeight.bold)),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Expanded(
                                                      child: DropdownButtonFormField<CreditCard>(
                                                          isExpanded: true,
                                                          value: _selectedCreditCard,
                                                          onChanged: (selected) =>
                                                              setState(() => _selectedCreditCard = selected),
                                                          validator: (value) =>
                                                              value != null ? null : "Credit card must be selected",
                                                          items: state.creditCards
                                                              .map((card) => DropdownMenuItem<CreditCard>(
                                                                    value: card,
                                                                    child: Text(card.number),
                                                                  ))
                                                              .toList()),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 32,
                                              ),
                                              FloatingActionButton.extended(
                                                onPressed: () {
                                                  if (_formKey.currentState.validate())
                                                    BlocProvider.of<NewTicketBloc>(context).add(NewTicketSubmitted(
                                                        creditCard: _selectedCreditCard, flight: widget.flight));
                                                },
                                                backgroundColor: Theme.of(context).primaryColorDark,
                                                label: Text(
                                                  "Buy ticket",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      else if (state is NewTicketReceived)
                                        return Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.flight,
                                                color: Colors.grey,
                                                size: 64,
                                              ),
                                              SizedBox(
                                                height: 64,
                                              ),
                                              Text(
                                                "Ticket successfully bought!",
                                                textAlign: TextAlign.center,
                                                style:
                                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Theme.of(context).primaryColorDark),
                                              )
                                            ],
                                          ),
                                        );
                                      else
                                        return ErrorButtonWidget(
                                            callback: () =>
                                                BlocProvider.of<NewTicketBloc>(context).add(NewTicketInit()));
                                    },
                                  )),
                            ),
                          )),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                ),
              ),
              Positioned(
                top: 0,
                child: CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.airplanemode_active),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
