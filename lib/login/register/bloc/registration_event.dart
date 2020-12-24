part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationCredentialsProvided extends RegistrationEvent {
  final String name;
  final String surname;
  final String email;
  final String passport;
  final String password1;
  final String password2;

  RegistrationCredentialsProvided(
      {@required this.name,
      @required this.surname,
      @required this.email,
      @required this.passport,
      @required this.password1,
      @required this.password2});
  
  @override
  List<Object> get props => [name, surname, email, passport, password1, password2];
}
