import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FieldSampling extends StatefulWidget {
  @override
  _FieldSamplingState createState() => _FieldSamplingState();
}

class _FieldSamplingState extends State<FieldSampling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#26E07F"),
        title: Text("Conduct a test",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.white,
            size: 35,
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
