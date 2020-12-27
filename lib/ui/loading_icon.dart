import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIcon extends StatefulWidget {

  final String text;

  const LoadingIcon({Key key, this.text = "Loading..."}) : super(key: key);

  @override
  _LoadingIconState createState() => _LoadingIconState();
}

class _LoadingIconState extends State<LoadingIcon> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SpinKitFadingCube(
          color: Theme.of(context).primaryColor,
          size: 65,
          controller:
          AnimationController(vsync: this, duration: const Duration(milliseconds: 500)),
        ),
        SizedBox(height: 64,),
        Text(
          widget.text,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
        )
      ],
    );
  }
}
