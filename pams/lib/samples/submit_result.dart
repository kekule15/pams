import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pams/samples/custom_drop_down.dart';
import 'package:pams/samples/data/microbial/data_models.dart';
import 'package:pams/samples/data/microbial/database_helper.dart';
import 'package:pams/samples/update_test.dart';
import 'package:pams/utils/custom_colors.dart';

import 'data/physioco/data_models.dart';
import 'data/physioco/database_helper.dart';

class SubmitResult extends StatefulWidget {
  final XFile? image;

  const SubmitResult({Key? key, this.image}) : super(key: key);

  @override
  _SubmitResultState createState() => _SubmitResultState();
}

class _SubmitResultState extends State<SubmitResult> {
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

  int? selectedId;
  void showDialogWithD(int id) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Delete Test'),
          content: Text(
            'Sure you wanna delete this test?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  DataBaseHelper.instance.remove(id);
                });
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void showDialogWithPhysioCo(int id) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Delete Test'),
          content: Text(
            'Sure you wanna delete this test?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  PhysicoDataBaseHelper.instance.remove(id);
                });
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
              'Confirm Test before Submitting',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: CustomDropDown(
                title: 'MicrobialParameters',
                body: FutureBuilder<List<MicroBial>>(
                    future: DataBaseHelper.instance.getMicrobial(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return snapshot.data!.isEmpty
                          ? Center(child: Text('No data on microbial'))
                          : ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: snapshot.data!.map((microbial) {
                                return Center(
                                    child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      selectedId = microbial.id;
                                                    });
                                                    print(selectedId);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    UpdateTest(
                                                                      id: selectedId,
                                                                      result: microbial
                                                                          .result,
                                                                      testName:
                                                                          microbial
                                                                              .name,
                                                                      limt: microbial
                                                                          .testlimit,
                                                                      unit: microbial
                                                                          .unit,
                                                                      method: microbial
                                                                          .method,
                                                                      sampleName:
                                                                          'microbialParameters',
                                                                    )));
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  )),
                                              SizedBox(
                                                width: 0,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    showDialogWithD(
                                                        microbial.id!);
                                                  },
                                                  icon: Icon(
                                                    Icons.clear,
                                                    color: Colors.red,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test name',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(microbial.name!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test Method',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(microbial.method!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test Result',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(microbial.result!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test unit',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(microbial.unit!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test limit',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(microbial.testlimit!),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                              }).toList(),
                            );
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: CustomDropDown(
                title: 'physicoParameters',
                body: FutureBuilder<List<PhysiCo>>(
                    future: PhysicoDataBaseHelper.instance.getPhysiCo(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return snapshot.data!.isEmpty
                          ? Center(child: Text('No data on microbial'))
                          : ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: snapshot.data!.map((physico) {
                                return Center(
                                    child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      selectedId = physico.id;
                                                    });
                                                    print(selectedId);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    UpdateTest(
                                                                      id: selectedId,
                                                                      result: physico
                                                                          .result,
                                                                      test_Performed_And_Unit:
                                                                          physico
                                                                              .name,
                                                                      limt: physico
                                                                          .testlimit,
                                                                      uc: physico
                                                                          .uc,
                                                                      method: physico
                                                                          .method,
                                                                      sampleName:
                                                                          'physicoParameters',
                                                                    )));
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  )),
                                              SizedBox(
                                                width: 0,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    showDialogWithPhysioCo(
                                                        physico.id!);
                                                  },
                                                  icon: Icon(
                                                    Icons.clear,
                                                    color: Colors.red,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test name',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(physico.name!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test Method',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(physico.method!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test Result',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(physico.result!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test unit',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(physico.uc!),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Test limit',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                            Text(physico.testlimit!),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                              }).toList(),
                            );
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: Text('Take a sample photo')),
            Container(
              child: Stack(
                children: [
                  _image == null
                      ? InkWell(
                          onTap: () async {
                            await takePhoto(ImageSource.camera, context);
                          },
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/field.jpg'),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                            await takePhoto(ImageSource.camera, context);
                          },
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
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
                          await takePhoto(ImageSource.camera, context);
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
              height: 100,
            ),
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
                  : print(_image.toString());
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
                  'Confirm Submit',
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
