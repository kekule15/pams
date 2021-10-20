import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pams/models/other_model/client_sample_model.dart';
import 'package:pams/models/other_model/test_template_model.dart';
import 'package:pams/services/api_services/repositories/clients_repository.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:pams/widgets/client_placeholder.dart';
import 'package:http/http.dart' as http;

final key = UniqueKey();

class ElementTest extends StatefulWidget {
  @override
  _ElementTestState createState() => _ElementTestState();
}

class _ElementTestState extends State<ElementTest> {
  bool isLoading = false;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(children: <Widget>[
          Text(
            "Upload photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ]));
  }

  void takePhoto(ImageSource source) async {
    final imageGotten = await _picker.getImage(source: source);
    setState(() {
      _imageFile = imageGotten;
    });
  }

  dosomthing(String value, String id) {
    print("===$value");
    print("===$id");
  }

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
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Form(
            // key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                _displayDialog();
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
        //backgroundColor: HexColor("#26E07F"),
        title: Text('Client name',
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView.builder(
            key: key,
            itemCount: 6,
            itemBuilder: (BuildContext context, index) {
              return Form(
                child: Container(
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
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Value name',
                              style: TextStyle(fontSize: 13),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration:
                                  BoxDecoration(color: Colors.grey[300]),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 2, 2, 2),
                                child: TextFormField(
                                  autofocus: false,
                                  keyboardAppearance: Brightness.dark,
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
                      ),
                    )),
              );
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: HexColor("#072468"),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: Text('Send',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
