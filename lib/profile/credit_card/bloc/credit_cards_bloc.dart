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

  }
}
