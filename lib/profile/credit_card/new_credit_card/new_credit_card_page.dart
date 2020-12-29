import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/profile/credit_card/new_credit_card/bloc/new_credit_card_bloc.dart';
import 'package:raf_airlines_client/ui/back_bar.dart';
import 'package:raf_airlines_client/ui/fullscreen_popup.dart';
import 'package:raf_airlines_client/ui/loading_icon.dart';

class NewCreditCardPage extends StatefulWidget {
  @override
  _NewCreditCardPageState createState() => _NewCreditCardPageState();
}

class _NewCreditCardPageState extends State<NewCreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  Future<void> _showPopup(BuildContext context, String text) async {
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) => FullscreenPopup(message: text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BackBar(),
              Expanded(
                child: BlocConsumer<NewCreditCardBloc, NewCreditCardState>(listener: (context, state) {
                  if (state is NewCreditCardInitial) {
                    setState(() {
                      cardNumber = '';
                      expiryDate = '';
                      cardHolderName = '';
                      cvvCode = '';
                      isCvvFocused = false;
                    });
                  } else if (state is NewCreditCardError)
                    _showPopup(context, "There has been an error adding credit card!");
                  else if (state is NewCreditCardCreated)
                    _showPopup(context, "Credit card successfully added!");
                }, builder: (context, state) {
                  if (state is NewCreditCardCreated || state is NewCreditCardInitial || state is NewCreditCardError)
                    return ListView(
                      children: [
                        CreditCardWidget(
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          showBackView: isCvvFocused,
                        ),
                        CreditCardForm(
                          onCreditCardModelChange: _onCreditCardModelChange,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        FloatingActionButton.extended(
                            onPressed: () => BlocProvider.of<NewCreditCardBloc>(context).add(NewCreditCardSubmitted(
                                number: cardNumber,
                                expiryDate: expiryDate,
                                cardHolderName: cardHolderName,
                                cvvCode: cvvCode)),
                            backgroundColor: Theme.of(context).primaryColorDark,
                            label: Text(
                              "Add new",
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                            ))
                      ],
                    );
                  else
                    return LoadingIcon();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
