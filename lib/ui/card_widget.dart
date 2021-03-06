import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clipper/ticket_clipper.dart';

// One time randomly generated
// passenger number for UI purposes
final int _passengerNumber = Random().nextInt(999999);

class CardWidget extends StatelessWidget {
  const CardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: TicketClipper(),
        child: Container(
          height: 175,
          child: Padding(
              padding: const EdgeInsets.only(right: 36, bottom: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(
                          "assets/raf.png",
                          height: 75,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Passenger #" + _passengerNumber.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                DateFormat("dd/MM/yy").format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 36),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome abroad ✈️",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColorDark,
                Theme.of(context).primaryColorDark.withOpacity(0.8)
              ], stops: [
                0.5,
                1
              ]),
              borderRadius: BorderRadius.circular(20.0)),
        ));
  }
}
