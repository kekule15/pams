import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/screens/client.dart';

class FieldSampling extends StatefulWidget {
  @override
  _FieldSamplingState createState() => _FieldSamplingState();
}

class _FieldSamplingState extends State<FieldSampling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
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
        body: ListView.builder(
            itemCount: 5,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ListTile(
                    title: Text("Flour Mill",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#072468"))),
                    subtitle: Text("Lagos",
                        style: TextStyle(
                            fontSize: 12, color: HexColor("#072468"))),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Client()));
                      },
                      child: Icon(Icons.arrow_forward_ios_sharp,
                          color: HexColor("#F58E34")),
                    ),
                  ),
                ),
              );
            }));
  }
}
