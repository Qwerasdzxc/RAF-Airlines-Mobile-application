import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/profile/change_password/bloc/change_password_bloc.dart';
import 'package:raf_airlines_client/ui/back_bar.dart';
import 'package:raf_airlines_client/ui/fullscreen_popup.dart';
import 'package:raf_airlines_client/ui/loading_icon.dart';
import 'package:raf_airlines_client/ui/white_list_item.dart';

class ChangePasswordPage extends StatelessWidget {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _showPopup(BuildContext context, String text) async {
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) =>
            FullscreenPopup(message: text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                BackBar(),
                Expanded(
                  child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                      listener: (context, state) {
                        if (state is ChangePasswordError)
                          _showPopup(context, "There was an error updating password!");
                        else if (state is ChangePasswordReady)
                          _showPopup(context, "Password successfuly updated!");
                      },
                      builder: (context, state) {
                        if (state is ChangePasswordReady || state is ChangePasswordError)
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "Update your current password",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColorDark),
                                ),
                              ),
                              WhiteListItem(
                                  icon: Icons.lock_clock,
                                  title: "Current password:",
                                  subtitle: "Your present password",
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _currentPasswordController,
                                  )),
                              WhiteListItem(
                                  icon: Icons.lock,
                                  title: "New password:",
                                  subtitle: "New secure password that you want to use",
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _newPasswordController,
                                    validator: (text) => text.trim().isNotEmpty ? null : "New password is empty",
                                  )),
                              WhiteListItem(
                                  icon: Icons.lock,
                                  title: "Repeat password:",
                                  subtitle: "Repeat new password",
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _repeatPasswordController,
                                    validator: (text) =>
                                        text == _newPasswordController.text ? null : "Passwords do not match",
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: FloatingActionButton.extended(
                                  backgroundColor: Theme.of(context).primaryColorDark,
                                  label: Text(
                                    "Update",
                                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () => {
                                    if (_formKey.currentState.validate())
                                      BlocProvider.of<ChangePasswordBloc>(context).add(ChangePasswordSubmitted(
                                          currentPassword: _currentPasswordController.text,
                                          newPassword: _newPasswordController.text,
                                          repeatPassword: _repeatPasswordController.text))
                                  },
                                ),
                              ),
                            ],
                          );
                        else
                          return LoadingIcon();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
