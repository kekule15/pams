import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pams/samples/custom_drop_down.dart';
import 'package:pams/screens/report/dpr/view_submitted_dpr_test.dart';
import 'package:pams/utils/custom_colors.dart';

class DPRReportPage extends StatefulWidget {
  @override
  _DPRReportPageState createState() => _DPRReportPageState();
}

class _DPRReportPageState extends State<DPRReportPage> {
  List<String> type = ['DPR', 'DPR', 'DPR', 'DPR'];
  List<String> clientName = [
    'Flour Mill Nig',
    'Cohn Jena',
    'Forah Tech',
    'Augustus'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        //backgroundColor: HexColor("#26E07F"),
        title: Text("Activities",
            style: TextStyle(color: Colors.black, fontSize: 20.sp)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
            itemCount: type.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  //height: 70,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        offset: Offset(0, 0.5),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: CustomDropDown(
                    downloadFile: () {},
                    title: Row(
                      children: [
                        Text(
                          type[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  CustomColors.mainblueColor.withOpacity(0.8)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(clientName[index]),
                      ],
                    ),
                    body: Column(
                      children: [
                        ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: 6,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewSubmittedDPRtest()));
                                    },
                                    leading: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.restore_page,
                                            size: 25,
                                            color: CustomColors.mainblueColor
                                                .withOpacity(0.8),
                                          ),
                                        )),
                                    title:
                                        Text("Water test", style: TextStyle()),
                                    subtitle: Row(
                                      children: <Widget>[
                                        Text("12 Apr 2021"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("10:29AM")
                                      ],
                                    ),
                                    trailing:
                                        Text("Delivered", style: TextStyle()),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
