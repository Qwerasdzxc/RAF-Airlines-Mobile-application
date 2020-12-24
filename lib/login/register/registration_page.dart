import 'package:flutter/material.dart';
import 'package:raf_airlines_client/ui/white_list_item.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontFamily: 'Axiforma'),
                  children: [
                    TextSpan(
                      text: "Welcome to ",
                    ),
                    TextSpan(
                        text: "RAF Airlines! ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            decoration: TextDecoration.underline)),
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
              child: TextField(
                controller: _nameController,
              )),
          WhiteListItem(
              icon: Icons.person,
              title: "Surname:",
              subtitle: "Your surname",
              child: TextField(
                controller: _surnameController,
              )),
          WhiteListItem(
              icon: Icons.email,
              title: "E-mail:",
              subtitle: "Your e-mail address (must be valid)",
              child: TextField(
                controller: _emailController,
              )),
          WhiteListItem(
              icon: Icons.assignment_ind_sharp,
              title: "Passport number:",
              subtitle: "Your passport number which will be used for travel",
              child: TextField(
                controller: _passportController,
              )),
          WhiteListItem(
              icon: Icons.lock,
              title: "Password:",
              subtitle: "Your secure password",
              child: TextField(
                controller: _password1Controller,
              )),
          WhiteListItem(
              icon: Icons.lock,
              title: "Repeat password:",
              subtitle: "Repeat your password",
              child: TextField(
                controller: _password2Controller,
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              height: 50,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () => print(""),
            ),
          )
        ],
      ),
    );
  }
}
