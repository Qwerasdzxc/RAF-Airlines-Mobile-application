import 'package:flutter/material.dart';

class ErrorButtonWidget extends StatelessWidget {

  final VoidCallback callback;

  const ErrorButtonWidget({Key key, @required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "An error occurred!\nPlease try again later",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 32,
          ),
          MaterialButton(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Refresh",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: callback,
          )
        ],
      ),
    );
  }
}
