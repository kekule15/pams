import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pams/screens/clients/dpr/dpr_implementation.dart';
import 'package:pams/screens/clients/dpr/run_test.dart';
import 'package:pams/screens/clients/dpr/submit_dpr.dart';
import 'package:pams/utils/constants.dart';
import 'package:pams/utils/custom_colors.dart';

class DPRScreen extends StatefulWidget {
  final int? locationId;

  const DPRScreen({Key? key, this.locationId}) : super(key: key);

  @override
  _DPRScreenState createState() => _DPRScreenState();
}

class _DPRScreenState extends State<DPRScreen> {
  Map<String, dynamic>? dprtemplates;
  @override
  void initState() {
    super.initState();
    getDPRtemplates();
    _determinePosition();
  }
Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await getLocation();
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  var latitude;
  var longitude;
  Future getDPRtemplates() async {
    final result = await DPRImplementation().getDPRTemplates(widget.locationId);
    if (result != null) {
      setState(() {
        dprtemplates = result;
      });
    }
  }

  bool sendLoader = false;
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
          title: Text("DPR Template",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        backgroundColor: CustomColors.background,
        body: dprtemplates == null
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: CustomColors.mainDarkGreen,
                  ),
                ),
              )
            : dprtemplates!['status'] == true
                ? ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Available test'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      listTemplateView(
                          dprtemplates!['returnObject']['pmTest'],
                          'PM Test',
                          dprtemplates!['returnObject']['pmTest']['testName'],
                          dprtemplates!['returnObject']['pmTest']['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['hmTest'],
                          'HM Test',
                          dprtemplates!['returnObject']['hmTest']['testName'],
                          dprtemplates!['returnObject']['hmTest']['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['noiseTest'],
                          'Noise Test',
                          dprtemplates!['returnObject']['noiseTest']
                              ['testName'],
                          dprtemplates!['returnObject']['noiseTest']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['nO2Test'],
                          'NO2 Test',
                          dprtemplates!['returnObject']['nO2Test']['testName'],
                          dprtemplates!['returnObject']['nO2Test']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['sO2Test'],
                          'SO2 Test',
                          dprtemplates!['returnObject']['sO2Test']['testName'],
                          dprtemplates!['returnObject']['sO2Test']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['h2STest'],
                          'H2S Test',
                          dprtemplates!['returnObject']['h2STest']['testName'],
                          dprtemplates!['returnObject']['h2STest']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['combTest'],
                          'Comb Test',
                          dprtemplates!['returnObject']['combTest']['testName'],
                          dprtemplates!['returnObject']['combTest']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['cO2Test'],
                          'CO2 Test',
                          dprtemplates!['returnObject']['cO2Test']['testName'],
                          dprtemplates!['returnObject']['cO2Test']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['vocTest'],
                          'VOC Test',
                          dprtemplates!['returnObject']['vocTest']['testName'],
                          dprtemplates!['returnObject']['vocTest']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['o2Test'],
                          'O2 Test',
                          dprtemplates!['returnObject']['o2Test']['testName'],
                          dprtemplates!['returnObject']['o2Test']['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['coTest'],
                          'CO Test',
                          dprtemplates!['returnObject']['coTest']['testName'],
                          dprtemplates!['returnObject']['coTest']['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['tempTest'],
                          'TEMP Test',
                          dprtemplates!['returnObject']['tempTest']['testName'],
                          dprtemplates!['returnObject']['tempTest']
                              ['testLimit']),
                      listTemplateView(
                          dprtemplates!['returnObject']['pM5Test'],
                          'PM5 Test',
                          dprtemplates!['returnObject']['pM5Test']['testName'],
                          dprtemplates!['returnObject']['pM5Test']
                              ['testLimit']),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (dprtemplates!['returnObject']['pmTest']['testLimit'] == null ||
                              dprtemplates!['returnObject']['hmTest']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['noiseTest']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['nO2Test']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['sO2Test']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['h2STest']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['combTest']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['cO2Test']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['vocTest']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['o2Test']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['coTest']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['tempTest']
                                      ['testLimit'] ==
                                  null ||
                              dprtemplates!['returnObject']['pM5Test']['testLimit'] == null) {
                            Constants()
                                .notify('Please complete all test to proceed');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubmitDPRPage(
                                      longitude: longitude,
                                      latitude: latitude,
                                    )));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: CustomColors.mainDarkGreen,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: sendLoader
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
                                        color: CustomColors.background,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text('No templates available'),
                  ));
  }

  listTemplateView(
      Map<String, dynamic> data, String title, String subtitle, String? limit) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute<Map<String, dynamic>>(
                        builder: (context) => RunTestScreen(
                              data: data,
                              title: title,
                            )));
                if (result != null) {
                  await getDPRtemplates();
                }
              },
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: limit == null
                  ? CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                    )
                  : CircleAvatar(
                      radius: 10,
                      backgroundColor: CustomColors.mainDarkGreen,
                      child: Icon(
                        Icons.check,
                        color: CustomColors.background,
                        size: 10,
                      ),
                    )),
        ),
        Divider()
      ],
    );
  }
}
