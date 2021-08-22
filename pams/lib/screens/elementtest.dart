import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/models/other_model/client_sample_model.dart';
import 'package:pams/models/other_model/test_template_model.dart';
import 'package:pams/services/api_services/repositories/clients_repository.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:pams/widgets/client_placeholder.dart';

final key = UniqueKey();

class ElementTest extends StatefulWidget {
  final String client_name;
  final String sample_id;

  const ElementTest(
      {Key? key, required this.client_name, required this.sample_id})
      : super(key: key);
  @override
  _ElementTestState createState() => _ElementTestState();
}

class _ElementTestState extends State<ElementTest> {
  dosomthing(String value, String id) {
    print("===$value");
    print("===$id");
  }
  // Map? testing;

  Future<void> allTestTemplates() async {
    String sample_id = widget.sample_id;
    var data = await ClientsRepository.getTestTemplates(sample_id);
    // setState(() {
    //   testing = data;
    // });
    // print("-----$testing");
    return data;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   allTestTemplates();
  // }

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: HexColor("#26E07F"),
        title: Text(widget.client_name,
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Water test",
                  style: TextStyle(
                    color: HexColor("#072468"),
                    fontSize: 25,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _displayDialog();
                  },
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: BoxDecoration(color: HexColor("#F58E34")),
                    child: Center(
                      child: Text("Add", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(color: HexColor("#F58E34")),
                  child: Center(
                    child: Text("Send", style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: allTestTemplates(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Template? getTestTemplate = snapshot.data;
                  // print(
                  //     "lenght=======${getTestTemplate!.returnObject!.testTemplates!.length}");
                  return snapshot.hasData
                      ? Container(
                          child: ListView.builder(
                              key: key,
                              itemCount: getTestTemplate!
                                  .returnObject!.testTemplates!.length,
                              itemBuilder: (BuildContext context, index) {
                                final valueName = getTestTemplate
                                    .returnObject!.testTemplates![index].name;
                                final valueId = getTestTemplate
                                    .returnObject!.testTemplates![index].id;
                                return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 0, 10, 10),
                                    child: Form(
                                      child: Container(
                                          margin: EdgeInsets.only(top: 20),
                                          height: 60,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    valueName!,
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(10),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.grey[300]),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(5, 2, 2, 2),
                                                      child: TextFormField(
                                                        onEditingComplete: () {
                                                          print("object");
                                                        },
                                                        onChanged: (value) {
                                                          print("====$value");
                                                        },
                                                        onFieldSubmitted:
                                                            (value) {
                                                          dosomthing(
                                                              value,
                                                              valueId
                                                                  .toString());
                                                        },
                                                        // onSaved: (value) {
                                                        //   print("======$value");
                                                        // },
                                                        autofocus: false,
                                                        keyboardAppearance:
                                                            Brightness.dark,
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Result',
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                );
                              }))
                      : Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                }),
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
    );
  }
}
