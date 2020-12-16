import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/login/login_page.dart';
import 'package:raf_airlines_client/services/user/dao/user_rest_dao.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

import 'login/bloc/login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAF Airlines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.blue[900]
      ),
      home: BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(userService: UserService(dao: UserRestDAO())),
        child: LoginPage(),
      ),
    );
  }
}
