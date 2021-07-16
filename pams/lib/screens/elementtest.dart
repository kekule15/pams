import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ElementTest extends StatefulWidget {
  @override
  _ElementTestState createState() => _ElementTestState();
}

class _ElementTestState extends State<ElementTest> {
  _displayDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 6,
            backgroundColor: Colors.transparent,
            child: _dialogWithTextField(context),
          );
        });
  }

  Widget _dialogWithTextField(BuildContext context) => Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Form(
            // key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  "Add sample type",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: HexColor("#072468"),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      // controller: _titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'title can not be empty';
                        }
                        return null;
                      },
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'sample type',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(7, 50, 7, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: HexColor("#F58E34"),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: HexColor("#F58E34"),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          // if (_formKey.currentState.validate()) {}
                          // return Navigator.of(context).pop(true);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: HexColor("#26E07F"),
        title: Text("Flour Mill",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Water test",
                          style: TextStyle(
                            color: HexColor("#072468"),
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(color: HexColor("#F58E34")),
                          child: Center(
                            child: Text("Send",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        _displayDialog();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 25,
                        width: 40,
                        decoration: BoxDecoration(color: HexColor("#F58E34")),
                        child: Center(
                          child: Text("Add",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            // to make elevation
                            BoxShadow(
                              color: Colors.grey[300]!,
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
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Nitrogen",
                                style: TextStyle(fontSize: 17),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Result',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            // to make elevation
                            BoxShadow(
                              color: Colors.grey[300]!,
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
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Oxygen",
                                style: TextStyle(fontSize: 17),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Result',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            // to make elevation
                            BoxShadow(
                              color: Colors.grey[300]!,
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
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Salt",
                                style: TextStyle(fontSize: 17),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Result',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            // to make elevation
                            BoxShadow(
                              color: Colors.grey[300]!,
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
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Co2",
                                style: TextStyle(fontSize: 17),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Result',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Icon(Icons.camera_alt, color: HexColor("#F58E34"), size: 40),
            Text("Take a photo"),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 40),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/backgroundImage.PNG")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
