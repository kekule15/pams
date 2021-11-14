import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        //backgroundColor: HexColor("#26E07F"),
        title: Text("Activities",
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, int) {
              return Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                height: 70,
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    // to make elevation
                    BoxShadow(
                      color: Colors.grey[300]!,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                    // to make the coloured border
                    BoxShadow(
                      
                      offset: Offset(0, 0.5),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                   
                  },
                  leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.restore_page,
                          size: 25,
                          
                        ),
                      )),
                  title: Text("Flour Mill - Water test",
                      style: TextStyle(
                        
                      )),
                  subtitle: Row(
                    children: <Widget>[
                      Text("12 Apr 2021"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("10:29AM")
                    ],
                  ),
                  trailing: Text("Delivered",
                      style: TextStyle(
                        
                      )),
                ),
              );
            }),
      ),
    );
  }
}
