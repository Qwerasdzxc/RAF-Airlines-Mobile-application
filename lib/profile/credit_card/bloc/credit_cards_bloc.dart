import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

part 'credit_cards_event.dart';

part 'credit_cards_state.dart';

class CreditCardsBloc extends Bloc<CreditCardsEvent, CreditCardsState> {
  final UserService service;

  CreditCardsBloc({@required this.service}) : super(CreditCardsLoading());

  @override
  Stream<CreditCardsState> mapEventToState(CreditCardsEvent event) async* {
    if (event is CreditCardsInit) {
      yield CreditCardsLoading();

      try {
        final data = await service.getMyCreditCards();

        yield CreditCardsLoaded(creditCards: data);
      } catch (_) {
        yield CreditCardsError();
      }
    } else if (event is CreditCardRemoved) {
      final currState = state;

      yield CreditCardsLoading();

      try {
        await service.deleteCreditCard(event.creditCard);

        yield CreditCardsLoaded(creditCards: (currState as CreditCardsLoaded).creditCards..remove(event.creditCard));
      } catch (e) {
        yield CreditCardsError();
      }
    } else if (event is CreditCardAdded) {
      final currState = state;
      yield CreditCardsLoading();

      yield CreditCardsLoaded(creditCards: (currState as CreditCardsLoaded).creditCards..add(event.creditCard));
    }
  }
}
