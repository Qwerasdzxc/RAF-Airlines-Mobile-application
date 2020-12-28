import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:raf_airlines_client/profile/user_info/bloc/user_info_bloc.dart';
import 'package:raf_airlines_client/profile/user_info/user_info_body.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';
import 'package:raf_airlines_client/ui/back_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTab = 0;

  List<Widget> _children = [
    BlocProvider<UserInfoBloc>(
        create: (_) => UserInfoBloc(service: getService<UserService>())..add(UserInfoInit()), child: UserInfoBody()),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BackBar(),
              MaterialSegmentedControl(
                children: {0: Text("User info"), 1: Text("Credit cards")},
                selectionIndex: _selectedTab,
                borderColor: Colors.grey,
                selectedColor: Theme.of(context).primaryColorDark,
                unselectedColor: Colors.white,
                borderRadius: 8.0,
                onSegmentChosen: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
              ),
              Expanded(
                child: AnimatedSwitcher(
                    layoutBuilder: (currChild, prevChildren) => currChild,
                    duration: Duration(milliseconds: 250),
                    child: _children[_selectedTab]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
