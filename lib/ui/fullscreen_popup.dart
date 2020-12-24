import 'dart:ui';

import 'package:flutter/material.dart';

class FullscreenPopup extends StatefulWidget {

  final String message;

  const FullscreenPopup({Key key, @required this.message}) : super(key: key);

  @override
  _FullscreenPopupState createState() => _FullscreenPopupState();
}

class _FullscreenPopupState extends State<FullscreenPopup> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 75,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: FloatingActionButton.extended(
                    label: Text(
                      "Close",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
