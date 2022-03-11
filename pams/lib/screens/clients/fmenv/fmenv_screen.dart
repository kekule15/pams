import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pams/screens/clients/dpr/dpr_implementation.dart';
import 'package:pams/screens/clients/dpr/run_test.dart';
import 'package:pams/screens/clients/dpr/submit_dpr.dart';
import 'package:pams/screens/clients/fmenv/fmenv_implementation.dart';
import 'package:pams/screens/clients/fmenv/run_test.dart';
import 'package:pams/utils/constants.dart';
import 'package:pams/utils/custom_colors.dart';

class FMENVScreen extends StatefulWidget {
  final int? locationId;

  const FMENVScreen({Key? key, this.locationId}) : super(key: key);

  @override
  _FMENVScreenState createState() => _FMENVScreenState();
}

class _FMENVScreenState extends State<FMENVScreen> {
  Map<String, dynamic>? fmenvtemplates;
  @override
  void initState() {
    super.initState();
    getFMENVtemplates();
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
  Future getFMENVtemplates() async {
    final result = await FMENVImplementation().getFMENVTemplates(widget.locationId);
    if (result != null) {
      setState(() {
        fmenvtemplates = result;
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
          title: Text("FMENV Template",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        backgroundColor: CustomColors.background,
        body: fmenvtemplates == null
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: CustomColors.mainDarkGreen,
                  ),
                ),
              )
            : fmenvtemplates!['status'] == true
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
                          fmenvtemplates!['returnObject']['pmTest'],
                          'PM Test',
                          fmenvtemplates!['returnObject']['pmTest']['testName'],
                          fmenvtemplates!['returnObject']['pmTest']['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['hmTest'],
                          'HM Test',
                          fmenvtemplates!['returnObject']['hmTest']['testName'],
                          fmenvtemplates!['returnObject']['hmTest']['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['noiseTest'],
                          'Noise Test',
                          fmenvtemplates!['returnObject']['noiseTest']
                              ['testName'],
                          fmenvtemplates!['returnObject']['noiseTest']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['nO2Test'],
                          'NO2 Test',
                          fmenvtemplates!['returnObject']['nO2Test']['testName'],
                          fmenvtemplates!['returnObject']['nO2Test']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['sO2Test'],
                          'SO2 Test',
                          fmenvtemplates!['returnObject']['sO2Test']['testName'],
                          fmenvtemplates!['returnObject']['sO2Test']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['h2STest'],
                          'H2S Test',
                          fmenvtemplates!['returnObject']['h2STest']['testName'],
                          fmenvtemplates!['returnObject']['h2STest']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['combTest'],
                          'Comb Test',
                          fmenvtemplates!['returnObject']['combTest']['testName'],
                          fmenvtemplates!['returnObject']['combTest']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['cO2Test'],
                          'CO2 Test',
                          fmenvtemplates!['returnObject']['cO2Test']['testName'],
                          fmenvtemplates!['returnObject']['cO2Test']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['vocTest'],
                          'VOC Test',
                          fmenvtemplates!['returnObject']['vocTest']['testName'],
                          fmenvtemplates!['returnObject']['vocTest']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['o2Test'],
                          'O2 Test',
                          fmenvtemplates!['returnObject']['o2Test']['testName'],
                          fmenvtemplates!['returnObject']['o2Test']['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['coTest'],
                          'CO Test',
                          fmenvtemplates!['returnObject']['coTest']['testName'],
                          fmenvtemplates!['returnObject']['coTest']['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['tempTest'],
                          'TEMP Test',
                          fmenvtemplates!['returnObject']['tempTest']['testName'],
                          fmenvtemplates!['returnObject']['tempTest']
                              ['testLimit']),
                      listTemplateView(
                          fmenvtemplates!['returnObject']['pM5Test'],
                          'PM5 Test',
                          fmenvtemplates!['returnObject']['pM5Test']['testName'],
                          fmenvtemplates!['returnObject']['pM5Test']
                              ['testLimit']),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (fmenvtemplates!['returnObject']['pmTest']['testLimit'] == null ||
                              fmenvtemplates!['returnObject']['hmTest']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['noiseTest']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['nO2Test']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['sO2Test']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['h2STest']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['combTest']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['cO2Test']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['vocTest']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['o2Test']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['coTest']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['tempTest']
                                      ['testLimit'] ==
                                  null ||
                              fmenvtemplates!['returnObject']['pM5Test']['testLimit'] == null) {
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
                        builder: (context) => RunFMENVTestScreen(
                              data: data,
                              title: title,
                            )));
                if (result != null) {
                  await getFMENVtemplates();
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
