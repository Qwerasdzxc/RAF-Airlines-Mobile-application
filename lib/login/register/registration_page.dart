import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/home/bloc/home_bloc.dart';
import 'package:raf_airlines_client/home/home_page.dart';
import 'package:raf_airlines_client/login/register/bloc/registration_bloc.dart';
import 'package:raf_airlines_client/services/flight/flight_service.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/services/ticket/ticket_service.dart';
import 'package:raf_airlines_client/ui/fade_in_widget.dart';
import 'package:raf_airlines_client/ui/fullscreen_popup.dart';
import 'package:raf_airlines_client/ui/white_list_item.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _showError(BuildContext context) async {
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) =>
            FullscreenPopup(message: "There was an error creating your account!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration️ ✈️"),
      ),
      body: Form(
        key: _formKey,
        child: BlocConsumer<RegistrationBloc, RegistrationState>(listener: (context, state) {
          if (state is RegistrationError) _showError(context);
        }, builder: (context, state) {
          if (state is! RegistrationSuccess)
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12).subtract(const EdgeInsets.only(bottom: 8)),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey, fontFamily: 'Axiforma'),
                        children: [
                          TextSpan(
                            text: "Welcome to ",
                          ),
                          TextSpan(
                              text: "RAF Airlines! ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark, decoration: TextDecoration.underline)),
                          TextSpan(
                            text: "Here you can create your new account and start flying with us",
                          ),
                        ]),
                  ),
                ),
                WhiteListItem(
                    icon: Icons.person,
                    title: "Name:",
                    subtitle: "Your name",
                    child: TextFormField(
                      controller: _nameController,
                      validator: (text) => text.trim().isNotEmpty ? null : "Name is required",
                    )),
                WhiteListItem(
                    icon: Icons.person,
                    title: "Surname:",
                    subtitle: "Your surname",
                    child: TextFormField(
                      controller: _surnameController,
                      validator: (text) => text.trim().isNotEmpty ? null : "Surname is required",
                    )),
                WhiteListItem(
                    icon: Icons.email,
                    title: "E-mail:",
                    subtitle: "Your e-mail address (must be valid)",
                    child: TextFormField(
                      controller: _emailController,
                      validator: (text) => text.trim().isNotEmpty ? null : "E-mail is required",
                    )),
                WhiteListItem(
                    icon: Icons.assignment_ind_sharp,
                    title: "Passport number:",
                    subtitle: "Your passport number which will be used for travel",
                    child: TextFormField(
                      controller: _passportController,
                      validator: (text) => text.trim().isNotEmpty ? null : "Passport is required",
                    )),
                WhiteListItem(
                    icon: Icons.lock,
                    title: "Password:",
                    subtitle: "Your secure password",
                    child: TextFormField(
                      obscureText: true,
                      controller: _password1Controller,
                      validator: (text) => text.trim().isNotEmpty ? null : "Password is required",
                    )),
                WhiteListItem(
                    icon: Icons.lock,
                    title: "Repeat password:",
                    subtitle: "Repeat your password",
                    child: TextFormField(
                      controller: _password2Controller,
                      obscureText: true,
                      validator: (text) => text == _password1Controller.text ? null : "Passwords don't match",
                    )),
                if (state is RegistrationInitial || state is RegistrationError)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FloatingActionButton.extended(
                      label: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => {
                        if (_formKey.currentState.validate())
                          BlocProvider.of<RegistrationBloc>(context).add(RegistrationCredentialsProvided(
                              name: _nameController.text,
                              surname: _surnameController.text,
                              email: _emailController.text,
                              passport: _passportController.text,
                              password1: _password1Controller.text,
                              password2: _password2Controller.text))
                      },
                    ),
                  )
                else
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            );
          else
            return FadeInWidget(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 64,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Your account has been created!\nLet's continue to the application",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    MaterialButton(
                        padding: const EdgeInsets.all(18),
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => BlocProvider<HomeBloc>(
                                create: (_) => HomeBloc(
                                    ticketService: getService<TicketService>(),
                                    flightService: getService<FlightService>())
                                  ..add(HomeInit()),
                                child: HomePage()))))
                  ],
                ),
              ),
            );
        }),
      ),
    );
  }
}
