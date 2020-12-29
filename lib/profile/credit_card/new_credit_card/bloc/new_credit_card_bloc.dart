import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/profile/credit_card/bloc/credit_cards_bloc.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

part 'new_credit_card_event.dart';

part 'new_credit_card_state.dart';

class NewCreditCardBloc extends Bloc<NewCreditCardEvent, NewCreditCardState> {
  final CreditCardsBloc creditCardsBloc;
  final UserService service;

  NewCreditCardBloc({@required this.creditCardsBloc, @required this.service}) : super(NewCreditCardInitial());

  @override
  Stream<NewCreditCardState> mapEventToState(NewCreditCardEvent event) async* {
    if (event is NewCreditCardClear)
      yield NewCreditCardInitial();
    else if (event is NewCreditCardSubmitted) {
      yield NewCreditCardLoading();

      try {
        int cvv = int.parse(event.cvvCode);

        final creditCard = await service.addCreditCard(CreditCard(number: event.number, ccv: cvv));

        creditCardsBloc.add(CreditCardAdded(creditCard: creditCard));

        yield NewCreditCardCreated(creditCard: creditCard);
      } catch (_) {
        yield NewCreditCardError();
      }
    }
  }
}
