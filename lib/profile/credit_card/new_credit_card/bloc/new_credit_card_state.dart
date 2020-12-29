part of 'new_credit_card_bloc.dart';

abstract class NewCreditCardState extends Equatable {
  const NewCreditCardState();

  @override
  List<Object> get props => [];
}

class NewCreditCardInitial extends NewCreditCardState {}

class NewCreditCardLoading extends NewCreditCardState {}

class NewCreditCardCreated extends NewCreditCardState {

  final CreditCard creditCard;

  NewCreditCardCreated({@required this.creditCard});

  @override
  List<Object> get props => [creditCard];
}

class NewCreditCardError extends NewCreditCardState {}