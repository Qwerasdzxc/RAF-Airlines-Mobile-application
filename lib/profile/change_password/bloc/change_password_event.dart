part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordSubmitted extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;
  final String repeatPassword;

  ChangePasswordSubmitted({@required this.currentPassword, @required this.newPassword, @required this.repeatPassword});

  @override
  List<Object> get props => [currentPassword, newPassword, repeatPassword];
}
