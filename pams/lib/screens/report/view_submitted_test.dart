import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/custom_colors.dart';

class ViewSubmittedtest extends StatefulWidget {
  const ViewSubmittedtest({Key? key}) : super(key: key);

  @override
  _ViewSubmittedtestState createState() => _ViewSubmittedtestState();
}

class _ViewSubmittedtestState extends State<ViewSubmittedtest> {
  TextEditingController testName = TextEditingController();
  TextEditingController testUnit = TextEditingController();
  TextEditingController testLimit = TextEditingController();
  TextEditingController testResult = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    updateFields();
  }

  updateFields() async {
    testName.text = 'testName';
    testUnit.text = 'testUnit';
    testLimit.text = 'testLimit';
    testResult.text = 'testResult';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('test Name',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      backgroundColor: CustomColors.background,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: testName,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'Field is required';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Test Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: testUnit,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'Field is required';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Test Unit',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: testLimit,
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'Field is required';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Test Limit',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: testResult,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'Field is required';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Test Result',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 0,
      //   color: Colors.white,
      //   child: InkWell(
      //     onTap: () async {
      //       runTest();
      //     },
      //     child: Container(
      //       margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      //       height: 60,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //           color: CustomColors.mainDarkGreen,
      //           borderRadius: BorderRadius.circular(10)),
      //       child: Center(
      //         child: update
      //             ? SizedBox(
      //                 height: 20,
      //                 width: 20,
      //                 child: CircularProgressIndicator(
      //                   color: CustomColors.background,
      //                 ),
      //               )
      //             : Text(
      //                 'Save',
      //                 style: TextStyle(
      //                     color: CustomColors.background, fontSize: 18),
      //               ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
