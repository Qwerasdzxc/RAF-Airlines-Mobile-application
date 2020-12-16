part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginCredentialsProvided extends LoginEvent {

  final String email;
  final String password;

  LoginCredentialsProvided({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
