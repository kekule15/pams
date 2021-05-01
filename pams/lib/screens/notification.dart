import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: HexColor("#26E07F"),
        title: Text("Notifications",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, int) {
            return Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              height: 70,
              width: MediaQuery.of(context).size.width / 1.4,
              decoration: BoxDecoration(
                boxShadow: [
                  // to make elevation
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                  // to make the coloured border
                  BoxShadow(
                    color: HexColor("#072468"),
                    offset: Offset(0, 0.5),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Flour Mill - Water test",
                            style: TextStyle(
                                color: HexColor("#072468"), fontSize: 17)),
                        Text("Delivered",
                            style: TextStyle(
                                color: HexColor("#072468"), fontSize: 17)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("12 Apr 2021",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("05:21AM",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
