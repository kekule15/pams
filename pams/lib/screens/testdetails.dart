import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TestDetails extends StatefulWidget {
  @override
  _TestDetailsState createState() => _TestDetailsState();
}

class _TestDetailsState extends State<TestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: HexColor("#26E07F"),
        title: Text("Test Details",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Flour Mill",
                style: TextStyle(
                    color: HexColor("#072468"),
                    fontWeight: FontWeight.bold,
                    fontSize: 26)),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              child: ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: HexColor("#F58E34"),
                ),
                title: Text(
                  "Test",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#072468"),
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Water",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
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
              child: ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: HexColor("#F58E34"),
                ),
                title: Text(
                  "Type",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#072468"),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Nitrogen"), Text("A23(GH)0")],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Air"), Text("A23(GH)0")],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Co2"), Text("A23(GH)0")],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Salt"), Text("A23(GH)0")],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
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
              child: ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: HexColor("#F58E34"),
                ),
                title: Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#072468"),
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Delivered",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
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
              child: ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: HexColor("#F58E34"),
                ),
                title: Text(
                  "Date & Time",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#072468"),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("19 Apr 2021"), Text("10:21AM")],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
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
              child: ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: HexColor("#F58E34"),
                ),
                title: Text(
                  "Co-ordinates",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#072468"),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Latitude"), Text("1274637")],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Longitude"), Text("3637298")],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
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
              child: ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: HexColor("#F58E34"),
                ),
                title: Text(
                  "Image",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#072468"),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/backgroundImage.PNG"))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
