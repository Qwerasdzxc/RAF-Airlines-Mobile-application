import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.airplanemode_active,
                    size: 48,
                    color: Colors.grey,
                  ),
                  MaterialButton(
                    elevation: 1,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "View",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => print("a"),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "NYC",
                      style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: DottedDecoration(shape: Shape.line, linePosition: LinePosition.bottom),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "BEG",
                      style: TextStyle(color: Colors.orange, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Distance: "),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "758 km",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.attach_money,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Price: "),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "350 EUR",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
