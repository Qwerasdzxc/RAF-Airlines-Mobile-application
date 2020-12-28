part of 'credit_cards_bloc.dart';

abstract class CreditCardsEvent extends Equatable {
  const CreditCardsEvent();

  @override
  List<Object> get props => [];
}

class CreditCardsInit extends CreditCardsEvent {}

class CreditCardAdded extends CreditCardsEvent {

  final CreditCard creditCard;

  CreditCardAdded({@required this.creditCard});

  @override
  List<Object> get props => [creditCard];
}

class CreditCardRemoved extends CreditCardsEvent {

  final CreditCard creditCard;

  CreditCardRemoved({@required this.creditCard});

  @override
  List<Object> get props => [creditCard];
}