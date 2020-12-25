import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(),
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.flight,
                            size: 32,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "RAF Airlines",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Hello,",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Let's discover a new adventure!",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.view_carousel,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Your tickets:",
                                  style: TextStyle(
                                      fontSize: 18, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 32,
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 15,
                              itemBuilder: (BuildContext context, int index) => Container(
                                width: 225,
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.flight_takeoff,
                                              color: Colors.grey,
                                              size: 28,
                                            ),
                                            Text(
                                              "BEG",
                                              style: TextStyle(
                                                  fontSize: 18, color: Colors.blue[800], fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.flight_land,
                                              color: Colors.grey,
                                              size: 28,
                                            ),
                                            Text(
                                              "LSB",
                                              style: TextStyle(
                                                  fontSize: 18, color: Colors.orange[800], fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Divider(
                                          height: 28,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.airplanemode_active,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              "Plane:  ",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Boeing 747",
                                              style: TextStyle(color: Colors.teal[800], fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.announcement,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              "Status:  ",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Active",
                                              style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 24,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Today's recommendations:",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () => print(""),
                            child: Text(
                              "View all",
                              style: TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) => Container(
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
                                              style: TextStyle(
                                                  color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    Container(
                                                      decoration: DottedDecoration(
                                                          shape: Shape.line, linePosition: LinePosition.bottom),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "BEG",
                                              style: TextStyle(
                                                  color: Colors.orange, fontSize: 22, fontWeight: FontWeight.bold),
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
