import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/custom_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http_parser/http_parser.dart';

class SubmitNESREAPage extends StatefulWidget {
  final double? longitude;
  final double? latitude;

  const SubmitNESREAPage({Key? key, this.longitude, this.latitude})
      : super(key: key);

  @override
  _SubmitNESREAPageState createState() => _SubmitNESREAPageState();
}

class _SubmitNESREAPageState extends State<SubmitNESREAPage> {
  @override
  void initState() {
    super.initState();
  }

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  takePhoto(ImageSource source, cxt) async {
    final pickedFile = await _picker.pickImage(
        source: source, imageQuality: 50, maxHeight: 500.0, maxWidth: 500.0);
    setState(() {
      _image = pickedFile;
    });

    // Navigator.pop(cxt);
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Submit NESREA Test",
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      backgroundColor: CustomColors.background,
      body: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Take a photo to proceed',
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
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
                            fit: BoxFit.fitWidth),
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
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: FileImage(
                              File(_image!.path.toString()),
                            )),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () async {
                await takePhoto(ImageSource.camera, context);
              },
              child: Center(
                  child: Icon(
                Icons.camera,
                color: CustomColors.mainDarkGreen,
                size: 30,
              )),
            ),
            // Text(widget.latitude!.toString()),
            // Text(widget.longitude!.toString()),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: InkWell(
          onTap: () async {},
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomColors.mainDarkGreen,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: submit
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: CustomColors.background,
                      ),
                    )
                  : Text(
                      'Submit',
                      style: TextStyle(
                          color: CustomColors.background, fontSize: 18),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  bool submit = false;
  // addCashier() async {
  //   setState(() {
  //     submit = true;
  //   });

  //   String fileName = _image!.path.split('/').last;
  //   print(fileName);

  //   var body = FormData.fromMap({
  //     "picture": await MultipartFile.fromFile(_image!.path,
  //         filename: fileName, contentType: MediaType('image', 'jpg')),
  //   });

  //   var dio = Dio();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('apiToken');

  //   Map<String, String> requestHeaders = {
  //     'content-type': 'application/json',
  //     'accept': 'application/json',
  //     'Content-Type:': ' multipart/form-data',
  //     'Picture=@oak_holding.jpeg;type=image/jpeg'
  //         'Authorization': 'Bearer $token'
  //   };
  //   var url = Constants.base_url + 
  //       "/FieldScientistAnalysisDPR/submit-dpr-test-Testresult?samplePtId=$samplePtId&DPRFieldId=$DPRFieldId&Latitude=$Latitude&Longitude=$Longitude&PmTestLimit=$PmTestLimit&PmTestResult=$PmTestResult&HmTestLimit=$HmTestLimit&HmTestResult=$HmTestResult&NoiseTestLimit=$NoiseTestLimit&NoiseTestResult=$NoiseTestResult&NO2TestLimit=$NO2TestLimit&No2TestResult=$No2TestResult&SO2TestLimit=$SO2TestLimit&So2TestResult=$So2TestResult&H2STestLimit=$H2STestLimit&H2STestResult=$H2STestResult&CombTestLimit=$CombTestLimit&CombTestResult=$CombTestResult&CO2TestLimit=$CO2TestLimit&Co2TestResult=$Co2TestResult&VocTestLimit=$VocTestLimit&VocTestResult=$VocTestResult&O2TestLimit=$O2TestLimit&O2TestResult=$O2TestResult&CoTestLimit=$CoTestLimit&CoTestResult=$CoTestResult&TempTestLimit=$TempTestLimit&TempTestResult=$TempTestResult&Pm5TestLimit=$Pm5TestLimit&Pm5TestResult=$Pm5TestResult";
  //   var response = await dio
  //       .post('https://www.landmarkafrica.com/ldc/public/api/cashier/new',
  //           data: body,
  //           options: Options(headers: {
  //             //'Content-Type': 'multipart/form-data',
  //             'Accept': 'application/json',
  //             'Authorization': 'Bearer $token',
  //           }))
  //       .then((value) async {
  //     setState(() {
  //       submit = false;
  //     });
  //     await Future.delayed(Duration(seconds: 1));
  //   });
  // }



}
