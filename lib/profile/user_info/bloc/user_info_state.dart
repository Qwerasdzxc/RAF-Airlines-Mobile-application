part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final bool isInEditMode;

  final String name;
  final String surname;
  final String email;
  final String passport;

  UserInfoLoaded(
      {@required this.isInEditMode,
      @required this.name,
      @required this.surname,
      @required this.email,
      @required this.passport});

  UserInfoLoaded copyWith({bool isInEditMode, String name, String surname, String email, String passport}) =>
      UserInfoLoaded(
          isInEditMode: isInEditMode ?? this.isInEditMode,
          name: name ?? this.name,
          surname: surname ?? this.surname,
          email: email ?? this.email,
          passport: passport ?? this.passport);

  @override
  List<Object> get props => [isInEditMode, name, surname, email, passport];
}

class UserInfoError extends UserInfoState {}