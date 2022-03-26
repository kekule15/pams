import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pams/samples/custom_drop_down.dart';
import 'package:pams/screens/report/dpr/view_submitted_dpr_test.dart';
import 'package:pams/screens/report/nesrea/submitted_nesrea_implementation.dart';
import 'package:pams/utils/custom_colors.dart';

import 'get_all_nesrea_submitted_test.dart';

class NESREAReportPage extends StatefulWidget {
  @override
  _NESREAReportPageState createState() => _NESREAReportPageState();
}

class _NESREAReportPageState extends State<NESREAReportPage> {
  @override
  void initState() {
    super.initState();
    getAllData();
  }

  GetAllNesreaSubmittedTest? data;
  int pageNumber = 1;

  Future getAllData() async {
    final result = await SubmittedNESREAImplementation()
        .getNESREASubmittedResult(pageNumber);
    if (result!.returnObject!.data!.isNotEmpty) {
      setState(() {
        data = result;
      });
    }
  }

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
        title: Text("NESREA Activities",
            style: TextStyle(color: Colors.black, fontSize: 20.sp)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: data == null
            ? Center(
                child: SizedBox(
                  height: 20.w,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    color: CustomColors.mainDarkGreen,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: data!.returnObject!.data!.length,
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
                              data!.returnObject!.data![index].clientName!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.mainblueColor
                                      .withOpacity(0.8)),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              data!.returnObject!.data![index].samplePointName!,
                            ),
                          ],
                        ),
                        body: Column(
                          children: [
                            ListView(
                              padding: EdgeInsets.all(0),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .pmTest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .pmTest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .pmTest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .pmTest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .pmTest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("PMTest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].pmTest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .hmTest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .hmTest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .hmTest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .hmTest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .hmTest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("HMTest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].hmTest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .noiseTest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .noiseTest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .noiseTest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .noiseTest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .noiseTest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("NoiseTest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].noiseTest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .nO2Test!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .nO2Test!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .nO2Test!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .nO2Test!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .nO2Test!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("NO2Test", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].nO2Test!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .sO2Test!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .sO2Test!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .sO2Test!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .sO2Test!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .sO2Test!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("SO2Test", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].sO2Test!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .h2STest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .h2STest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .h2STest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .h2STest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .h2STest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("H2STest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].h2STest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .combTest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .combTest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .combTest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .combTest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .combTest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("CombTest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].combTest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .cO2Test!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .cO2Test!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .cO2Test!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .cO2Test!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .cO2Test!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("CO2Test", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].cO2Test!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .vocTest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .vocTest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .vocTest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .vocTest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .vocTest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("VocTest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].vocTest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .o2Test!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .o2Test!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .o2Test!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .o2Test!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .o2Test!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("O2Test", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].o2Test!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .coTest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .coTest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .coTest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .coTest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .coTest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("CoTest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].coTest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .tempTest!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .tempTest!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .tempTest!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .tempTest!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .tempTest!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("TempTest", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].tempTest!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSubmittedDPRtest(
                                                  name: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .pM5Test!
                                                      .testName!,
                                                  unit: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .pM5Test!
                                                      .testUnit!,
                                                  limit: data!
                                                              .returnObject!
                                                              .data![index]
                                                              .pM5Test!
                                                              .testLimit ==
                                                          null
                                                      ? 'null'
                                                      : data!
                                                          .returnObject!
                                                          .data![index]
                                                          .pM5Test!
                                                          .testLimit,
                                                  result: data!
                                                      .returnObject!
                                                      .data![index]
                                                      .pM5Test!
                                                      .testResult!,
                                                )));
                                  },
                                  title: Row(children: <Widget>[
                                    Text("PM5Test", style: TextStyle()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${data!.returnObject!.data![index].pM5Test!.testName!}",
                                        style: TextStyle()),
                                  ]),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(DateFormat('d MMMM y')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(DateFormat('HH:mm:ss')
                                          .format(
                                            data!.returnObject!.data![index]
                                                .time!,
                                          )
                                          .toString()),
                                    ],
                                  ),
                                  trailing:
                                      Text("Delivered", style: TextStyle()),
                                ),
                                Divider(),
                              ],
                            ),
                          ],
                        ),
                      ));
                }),
      ),
    );
  }
}
