import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {

  final UserService service;

  ChangePasswordBloc({@required this.service}) : super(ChangePasswordReady());

  @override
  Stream<ChangePasswordState> mapEventToState(ChangePasswordEvent event) async* {
    if (event is ChangePasswordSubmitted) {
      yield ChangePasswordLoading();
      
      try {
        if (event.newPassword != event.repeatPassword)
          throw Exception();
        
        await service.updatePassword(event.currentPassword, event.newPassword);
        
        yield ChangePasswordReady();
      } catch (_) {
        yield ChangePasswordError();
      }
    }
  }
}
