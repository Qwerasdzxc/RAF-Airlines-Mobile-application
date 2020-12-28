import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserService service;

  UserInfoBloc({@required this.service}) : super(UserInfoLoading());

  @override
  Stream<UserInfoState> mapEventToState(UserInfoEvent event) async* {
    if (event is UserInfoInit) {
      try {
        final profile = await service.getMyProfile();

        yield UserInfoLoaded(
            isInEditMode: false,
            name: profile.name,
            surname: profile.surname,
            email: profile.email,
            passport: profile.passport);
      } catch (_) {
        yield UserInfoError();
      }
    }
    if (event is UserInfoEditModeChanged) {
      UserInfoLoaded currState = state;
      if (currState.isInEditMode) {
        yield UserInfoLoading();

        try {
          await service.updateProfile(currState.name, currState.surname, currState.email, currState.passport);

          yield currState.copyWith(isInEditMode: false);
        } catch (_) {
          yield UserInfoError();
        }
      } else {
        yield currState.copyWith(isInEditMode: true);
      }
    } else if (event is UserInfoNameChanged)
      yield (state as UserInfoLoaded).copyWith(name: event.name);
    else if (event is UserInfoSurnameChanged)
      yield (state as UserInfoLoaded).copyWith(surname: event.surname);
    else if (event is UserInfoEmailChanged)
      yield (state as UserInfoLoaded).copyWith(email: event.email);
    else if (event is UserInfoPassportChanged) yield (state as UserInfoLoaded).copyWith(passport: event.passport);
  }
}
