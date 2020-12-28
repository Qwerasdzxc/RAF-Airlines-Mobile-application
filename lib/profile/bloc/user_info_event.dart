part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

class UserInfoInit extends UserInfoEvent {}

class UserInfoEditModeChanged extends UserInfoEvent {}

class UserInfoNameChanged extends UserInfoEvent {

  final String name;

  UserInfoNameChanged({@required this.name});

  @override
  List<Object> get props => [name];
}

class UserInfoSurnameChanged extends UserInfoEvent {

  final String surname;

  UserInfoSurnameChanged({@required this.surname});

  @override
  List<Object> get props => [surname];
}

class UserInfoEmailChanged extends UserInfoEvent {

  final String email;

  UserInfoEmailChanged({@required this.email});

  @override
  List<Object> get props => [email];
}

class UserInfoPassportChanged extends UserInfoEvent {

  final String passport;

  UserInfoPassportChanged({@required this.passport});

  @override
  List<Object> get props => [passport];
}