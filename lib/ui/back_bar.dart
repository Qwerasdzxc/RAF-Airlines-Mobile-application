import 'package:flutter/material.dart';

class BackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                )),
            SizedBox(
              width: 16,
            ),
            Text("Go back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
