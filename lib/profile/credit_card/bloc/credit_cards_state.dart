part of 'credit_cards_bloc.dart';

abstract class CreditCardsState extends Equatable {
  const CreditCardsState();

  @override
  List<Object> get props => [];
}

class CreditCardsLoading extends CreditCardsState {}

class CreditCardsLoaded extends CreditCardsState {

  final List<CreditCard> creditCards;

  CreditCardsLoaded({@required this.creditCards});

  @override
  List<Object> get props => [creditCards];
}

class CreditCardsError extends CreditCardsState {}