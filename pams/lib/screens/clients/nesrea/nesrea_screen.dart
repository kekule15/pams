import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pams/screens/clients/dpr/dpr_implementation.dart';
import 'package:pams/screens/clients/dpr/run_test.dart';
import 'package:pams/screens/clients/dpr/submit_dpr.dart';
import 'package:pams/screens/clients/fmenv/fmenv_implementation.dart';
import 'package:pams/screens/clients/fmenv/run_test.dart';
import 'package:pams/screens/clients/nesrea/run_test.dart';
import 'package:pams/screens/clients/nesrea/submit_nesrea.dart';
import 'package:pams/utils/constants.dart';
import 'package:pams/utils/custom_colors.dart';

import 'nesrea_implementation.dart';

class NESREAScreen extends StatefulWidget {
  final int? locationId;

  const NESREAScreen({Key? key, this.locationId}) : super(key: key);

  @override
  _NESREAScreenState createState() => _NESREAScreenState();
}

class _NESREAScreenState extends State<NESREAScreen> {
  Map<String, dynamic>? nesreatemplates;
  @override
  void initState() {
    super.initState();
    getNESREAtemplates();
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
  Future getNESREAtemplates() async {
    final result =
        await NESREAImplementation().getNESREATemplates(widget.locationId);
    if (result != null) {
      setState(() {
        nesreatemplates = result;
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
          title: Text("NESREA Template",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        backgroundColor: CustomColors.background,
        body: nesreatemplates == null
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: CustomColors.mainDarkGreen,
                  ),
                ),
              )
            : nesreatemplates!['status'] == true
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
                          nesreatemplates!['returnObject']['pmTest'],
                          'PM Test',
                          nesreatemplates!['returnObject']['pmTest']['testName'],
                          nesreatemplates!['returnObject']['pmTest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['hmTest'],
                          'HM Test',
                          nesreatemplates!['returnObject']['hmTest']['testName'],
                          nesreatemplates!['returnObject']['hmTest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['noiseTest'],
                          'Noise Test',
                          nesreatemplates!['returnObject']['noiseTest']
                              ['testName'],
                          nesreatemplates!['returnObject']['noiseTest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['nO2Test'],
                          'NO2 Test',
                          nesreatemplates!['returnObject']['nO2Test']
                              ['testName'],
                          nesreatemplates!['returnObject']['nO2Test']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['sO2Test'],
                          'SO2 Test',
                          nesreatemplates!['returnObject']['sO2Test']
                              ['testName'],
                          nesreatemplates!['returnObject']['sO2Test']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['h2STest'],
                          'H2S Test',
                          nesreatemplates!['returnObject']['h2STest']
                              ['testName'],
                          nesreatemplates!['returnObject']['h2STest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['combTest'],
                          'Comb Test',
                          nesreatemplates!['returnObject']['combTest']
                              ['testName'],
                          nesreatemplates!['returnObject']['combTest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['cO2Test'],
                          'CO2 Test',
                          nesreatemplates!['returnObject']['cO2Test']
                              ['testName'],
                          nesreatemplates!['returnObject']['cO2Test']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['vocTest'],
                          'VOC Test',
                          nesreatemplates!['returnObject']['vocTest']
                              ['testName'],
                          nesreatemplates!['returnObject']['vocTest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['o2Test'],
                          'O2 Test',
                          nesreatemplates!['returnObject']['o2Test']['testName'],
                          nesreatemplates!['returnObject']['o2Test']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['coTest'],
                          'CO Test',
                          nesreatemplates!['returnObject']['coTest']['testName'],
                          nesreatemplates!['returnObject']['coTest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['tempTest'],
                          'TEMP Test',
                          nesreatemplates!['returnObject']['tempTest']
                              ['testName'],
                          nesreatemplates!['returnObject']['tempTest']
                              ['testLimit']),
                      listTemplateView(
                          nesreatemplates!['returnObject']['pM5Test'],
                          'PM5 Test',
                          nesreatemplates!['returnObject']['pM5Test']
                              ['testName'],
                          nesreatemplates!['returnObject']['pM5Test']
                              ['testLimit']),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (nesreatemplates!['returnObject']['pmTest']['testLimit'] == null ||
                              nesreatemplates!['returnObject']['hmTest']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['noiseTest']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['nO2Test']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['sO2Test']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['h2STest']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['combTest']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['cO2Test']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['vocTest']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['o2Test']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['coTest']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['tempTest']
                                      ['testLimit'] ==
                                  null ||
                              nesreatemplates!['returnObject']['pM5Test']['testLimit'] == null) {
                            Constants()
                                .notify('Please complete all test to proceed');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubmitNESREAPage(
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
                        builder: (context) => RunNESREATestScreen(
                              data: data,
                              title: title,
                            )));
                if (result != null) {
                  await getNESREAtemplates();
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