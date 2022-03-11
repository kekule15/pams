import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/custom_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitDPRPage extends StatefulWidget {
  const SubmitDPRPage({Key? key}) : super(key: key);

  @override
  _SubmitDPRPageState createState() => _SubmitDPRPageState();
}

class _SubmitDPRPageState extends State<SubmitDPRPage> {
  @override
  void initState() {
    // TODO: implement initState
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
        title: Text("Submit DPR Test",
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
            )
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
}
