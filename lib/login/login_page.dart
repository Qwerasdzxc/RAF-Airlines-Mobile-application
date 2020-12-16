import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/home/home_page.dart';
import 'package:raf_airlines_client/login/bloc/login_bloc.dart';
import 'package:raf_airlines_client/ui/card_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController(text: "client@raf-airlines.com");
  final TextEditingController _passwordController = TextEditingController(text: "pAsSwOrD");

  AnimationController _rotationController;

  double _lower = 0;
  double _upper = 0.03;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _rotationController.forward();
    _rotationController.repeat(reverse: true);
    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.reverse)
        setState(() {
          _lower = Random().nextDouble() / 100 - 0.05;
        });
      else if (status == AnimationStatus.forward)
        setState(() {
          _upper = Random().nextDouble() / 33.33 + 0.01;
        });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rotationController.dispose();

    super.dispose();
  }

  void login(BuildContext context) async {
    if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) return;

    BlocProvider.of<LoginBloc>(context).add(LoginCredentialsProvided(
        email: _emailController.text.trim(), password: _passwordController.text.trim()));
  }

  void navigateToHomeScreen() =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text("RAF Airlines",
                          style: TextStyle(
                              fontSize: 22,
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontFamily: 'Axiforma'),
                            children: [
                              TextSpan(
                                text: "Your airlines of ",
                              ),
                              TextSpan(
                                  text: "security and trust! ",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      decoration: TextDecoration.underline)),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RotationTransition(
                        turns: Tween(begin: _lower, end: _upper).animate(_rotationController),
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: CardWidget(),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              indent: 32,
              endIndent: 32,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.only(top: 4, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        hintText: 'E-mail',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.only(top: 4, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
                    if (state is LoginSuccessful) navigateToHomeScreen();
                  }, builder: (context, state) {
                    if (state is LoginInitial || state is LoginError)
                      return InkWell(
                        onTap: () => login(context),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).primaryColorDark,
                                  Theme.of(context).primaryColor,
                                ],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              'Sign in'.toUpperCase(),
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    else
                      return Center(child: CircularProgressIndicator(),);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
