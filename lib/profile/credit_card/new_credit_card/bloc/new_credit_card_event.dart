part of 'new_credit_card_bloc.dart';

abstract class NewCreditCardEvent extends Equatable {
  const NewCreditCardEvent();

  @override
  List<Object> get props => [];
}

class NewCreditCardClear extends NewCreditCardEvent {}

class NewCreditCardSubmitted extends NewCreditCardEvent {

  final String number;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  NewCreditCardSubmitted({@required this.number, @required this.expiryDate, @required this.cardHolderName, @required this.cvvCode});

  @override
  List<Object> get props => [number, expiryDate, cardHolderName, cvvCode];
}