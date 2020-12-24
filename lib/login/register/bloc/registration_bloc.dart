import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserService service;

  RegistrationBloc({@required this.service}) : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegistrationCredentialsProvided) {
      yield RegistrationLoading();

      try {
        if (event.password1 != event.password2)
          throw Exception();

        await service.register(
            event.name, event.surname, event.email, event.password1, event.passport);

        yield RegistrationSuccess();
      } catch (e) {
        yield RegistrationError();
      }
    }
  }
}
