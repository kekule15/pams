import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/models/other_model/client_sample_model.dart';
import 'package:pams/screens/elementtest.dart';
import 'package:pams/services/api_services/repositories/clients_repository.dart';
import 'package:pams/widgets/client_placeholder.dart';
import 'package:shimmer/shimmer.dart';

class ClientSamples extends StatefulWidget {
  final String client_id;
  final String client_name;
  const ClientSamples(
      {Key? key, required this.client_id, required this.client_name})
      : super(key: key);

  @override
  _ClientSamplesState createState() => _ClientSamplesState();
}

class _ClientSamplesState extends State<ClientSamples> {
  Future<void> allClientSamples() async {
    String client_id = widget.client_id;
    var data = await ClientsRepository.getAllClientsSamplings(client_id);
    return data;
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
                  "Add sample",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: HexColor("#072468"),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
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
                        hintText: 'sample',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
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
        title: Text(widget.client_name,
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Select what to test",
                    style: TextStyle(
                      color: HexColor("#072468"),
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _displayDialog();
                    },
                    child: Container(
                      height: 25,
                      width: 60,
                      decoration: BoxDecoration(color: HexColor("#F58E34")),
                      child: Center(
                        child:
                            Text("Add", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                    future: allClientSamples(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      ClientSampleModel? getIt = snapshot.data;
                      return snapshot.connectionState == ConnectionState.waiting
                          ? ClientPlaceHlder()
                          : snapshot.hasData
                              ? Container(
                                  child: ListView.builder(
                                      itemCount: getIt!.returnObject!.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        final sam = getIt.returnObject![index];
                                        final sample_id = getIt
                                            .returnObject![index]
                                            .testTemplates![index]
                                            .sampleTemplateId
                                            .toString();
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ElementTest(
                                                          
                                                        )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 5),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                              child: ListTile(
                                                title: Text(sam.name!),
                                                trailing: InkWell(
                                                  child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_sharp,
                                                      color:
                                                          HexColor("#F58E34")),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }))
                              : Container(
                                  child: Center(
                                    child: Text(
                                      'Empty',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 20),
                                    ),
                                  ),
                                );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
