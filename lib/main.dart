import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raf_airlines_client/login/login_page.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

import 'login/bloc/login_bloc.dart';

void main() {
  _launchProduction();
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
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColorDark: Colors.blue[900],
        primaryColor: Colors.blue[700],
      ),
      home: BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(userService: getService<UserService>()),
        child: LoginPage(),
      ),
    );
  }
}
