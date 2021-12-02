import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pams/samples/custom_drop_down.dart';
import 'package:pams/samples/sample_implementation.dart';
import 'package:pams/samples/submit_result.dart';
import 'package:pams/screens/elementtest.dart';
import 'package:pams/utils/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientsSample extends StatefulWidget {
  final String? sampleType;
  final String? clientName;
  final String? clientId;
  final List? templateData;

  const ClientsSample(
      {Key? key,
      this.clientName,
      this.sampleType,
      this.clientId,
      this.templateData})
      : super(key: key);

  @override
  _ClientsSampleState createState() => _ClientsSampleState();
}

class _ClientsSampleState extends State<ClientsSample> {
  @override
  void initState() {
    print(widget.templateData);
    super.initState();
  }

  var _image;
  final ImagePicker _picker = ImagePicker();

  takePhoto(ImageSource source, cxt) async {
    final pickedFile = await _picker.pickImage(
        source: source, imageQuality: 50, maxHeight: 500.0, maxWidth: 500.0);
    setState(() {
      _image = pickedFile;
    });

    // Navigator.pop(cxt);
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('${widget.clientName}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(widget.sampleType!, style: TextStyle(color: Colors.black)),
            SizedBox(
              height: 20,
            ),
            widget.templateData!.length == 0
                ? Center(
                    child: Text('No Sample Template for this Client'),
                  )
                : Column(
                    children: [
                      CustomDropDown(
                        title: 'physicoParameters',
                        body: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget
                                .templateData![0]['physicoParameters'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ElementTest(
                                                  test_Performed_And_Unit: widget
                                                              .templateData![0][
                                                          'physicoParameters'][index]
                                                      [
                                                      'test_Performed_And_Unit'],
                                                  sampleName:
                                                      'physicoParameters',
                                                  uc: widget.templateData![0]
                                                          ['physicoParameters']
                                                      [index]['uc'],
                                                  method: widget
                                                              .templateData![0]
                                                          ['physicoParameters']
                                                      [index]['test_Method'],
                                                  unit: widget.templateData![0]
                                                          ['physicoParameters']
                                                      [index]['unit'],
                                                  limt: widget.templateData![0]
                                                          ['physicoParameters']
                                                      [index]['limit'],
                                                  testName: widget
                                                              .templateData![0]
                                                          ['physicoParameters']
                                                      [index]['parameter'],
                                                )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Text(widget.templateData![0]
                                              ['physicoParameters'][index]
                                              ['parameter']
                                          .toString()),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomDropDown(
                        title: 'microbialParameters',
                        body: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget
                                .templateData![0]['microbialParameters'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ElementTest(
                                                  sampleName:
                                                      'microbialParameters',
                                                  method: widget
                                                              .templateData![0][
                                                          'microbialParameters']
                                                      [index]['test_Method'],
                                                  unit: widget.templateData![0][
                                                          'microbialParameters']
                                                      [index]['unit'],
                                                  limt: widget.templateData![0][
                                                          'microbialParameters']
                                                      [index]['limit'],
                                                  testName: widget
                                                              .templateData![0][
                                                          'microbialParameters']
                                                      [
                                                      index]['microbial_Group'],
                                                )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Text(widget.templateData![0]
                                              ['microbialParameters'][index]
                                              ['microbial_Group']
                                          .toString()),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Take a sample photo'),
                      Container(
                        child: Stack(
                          children: [
                            _image == null
                                ? InkWell(
                                    onTap: () async {
                                      await takePhoto(
                                          ImageSource.camera, context);
                                    },
                                    child: Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/field.jpg'),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      await takePhoto(
                                          ImageSource.camera, context);
                                    },
                                    child: Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.2)),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: FileImage(
                                              File(_image.path.toString()),
                                            )),
                                      ),
                                    ),
                                  ),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () async {
                                    await takePhoto(
                                        ImageSource.camera, context);
                                  },
                                  child: Icon(
                                    Icons.photo_camera,
                                    color: CustomColors.Darkblue,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: InkWell(
            onTap: () async {
              _image == null
                  ? Fluttertoast.showToast(
                      msg: "Take a photo before proceeding ",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0)
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SubmitResult(
                            image: _image,
                          )));
              print(_image.toString());
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color:
                    _image == null ? Colors.grey : CustomColors.mainDarkGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style:
                      TextStyle(color: CustomColors.background, fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}