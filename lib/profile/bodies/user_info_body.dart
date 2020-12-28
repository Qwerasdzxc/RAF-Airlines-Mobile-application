import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/profile/bloc/user_info_bloc.dart';
import 'package:raf_airlines_client/profile/change_password/bloc/change_password_bloc.dart';
import 'package:raf_airlines_client/profile/change_password/change_password_page.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';
import 'package:raf_airlines_client/ui/error_button_widget.dart';
import 'package:raf_airlines_client/ui/loading_icon.dart';
import 'package:raf_airlines_client/ui/white_list_item.dart';

class UserInfoBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocConsumer<UserInfoBloc, UserInfoState>(listener: (context, state) {
        if (state is UserInfoLoaded && !state.isInEditMode) {
          _nameController.text = state.name;
          _surnameController.text = state.surname;
          _emailController.text = state.email;
          _passportController.text = state.passport;
        }

        _nameController.addListener(
            () => BlocProvider.of<UserInfoBloc>(context).add(UserInfoNameChanged(name: _nameController.text)));
        _surnameController.addListener(
            () => BlocProvider.of<UserInfoBloc>(context).add(UserInfoSurnameChanged(surname: _surnameController.text)));
        _emailController.addListener(
            () => BlocProvider.of<UserInfoBloc>(context).add(UserInfoEmailChanged(email: _emailController.text)));
        _passportController.addListener(() =>
            BlocProvider.of<UserInfoBloc>(context).add(UserInfoPassportChanged(passport: _passportController.text)));
      }, builder: (context, state) {
        if (state is UserInfoLoaded)
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider<ChangePasswordBloc>(
                            create: (_) => ChangePasswordBloc(service: getService<UserService>()),
                            child: ChangePasswordPage(),
                          ))),
                  child: Text(
                    "Update password",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              WhiteListItem(
                  icon: Icons.person,
                  title: "Name:",
                  subtitle: "Your name",
                  child: TextFormField(
                    enabled: state.isInEditMode,
                    controller: _nameController,
                    validator: (text) => text.trim().isNotEmpty ? null : "Name is required",
                  )),
              WhiteListItem(
                  icon: Icons.person,
                  title: "Surname:",
                  subtitle: "Your surname",
                  child: TextFormField(
                    enabled: state.isInEditMode,
                    controller: _surnameController,
                    validator: (text) => text.trim().isNotEmpty ? null : "Surname is required",
                  )),
              WhiteListItem(
                  icon: Icons.email,
                  title: "E-mail:",
                  subtitle: "Your e-mail address (must be valid)",
                  child: TextFormField(
                    enabled: state.isInEditMode,
                    controller: _emailController,
                    validator: (text) => text.trim().isNotEmpty ? null : "E-mail is required",
                  )),
              WhiteListItem(
                  icon: Icons.assignment_ind_sharp,
                  title: "Passport number:",
                  subtitle: "Your passport number which will be used for travel",
                  child: TextFormField(
                    enabled: state.isInEditMode,
                    controller: _passportController,
                    validator: (text) => text.trim().isNotEmpty ? null : "Passport is required",
                  )),
              Padding(
                padding: const EdgeInsets.all(12),
                child: FloatingActionButton.extended(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  label: Text(
                    state.isInEditMode ? "Save" : "Edit",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => {
                    if (_formKey.currentState.validate())
                      BlocProvider.of<UserInfoBloc>(context).add(UserInfoEditModeChanged())
                  },
                ),
              ),
            ],
          );
        else if (state is UserInfoLoading)
          return LoadingIcon(
            text: "Loading profile...",
          );
        else
          return ErrorButtonWidget(callback: () => BlocProvider.of<UserInfoBloc>(context).add(UserInfoInit()));
      }),
    );
  }
}
