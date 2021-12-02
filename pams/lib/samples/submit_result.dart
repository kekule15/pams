import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pams/samples/custom_drop_down.dart';
import 'package:pams/samples/data/data_models.dart';
import 'package:pams/samples/data/database_helper.dart';

class SubmitResult extends StatefulWidget {
  final XFile? image;

  const SubmitResult({Key? key, this.image}) : super(key: key);

  @override
  _SubmitResultState createState() => _SubmitResultState();
}

class _SubmitResultState extends State<SubmitResult> {
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
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
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
              height: 20,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: FileImage(
                      File(widget.image!.path.toString()),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
