import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/login/login_page.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/services/user/dao/user_rest_dao.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

import 'login/bloc/login_bloc.dart';

void main() {
  _launchMock();
}

void _launchProduction() {
  // Provide GetIt REST services
  initRestServices();

  // Launch the application
  _startApplication();
}

void _launchMock() {
  // Provide GetIt mock services
  initMockServices();

  // Launch the application
  _startApplication();
}

void _startApplication() {
  runApp(RafAirlinesApp());
}

class RafAirlinesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAF Airlines',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        primaryColorDark: Colors.blue[900]
      ),
      home: BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(userService: getService<UserService>()),
        child: LoginPage(),
      ),
    );
  }
}
