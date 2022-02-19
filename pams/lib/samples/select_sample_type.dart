import 'package:flutter/material.dart';
import 'package:pams/samples/clients_samples.dart';
import 'package:pams/samples/sample_implementation.dart';

class SelectSampleType extends StatefulWidget {
  final String? clientName;
  final String? clientId;

  const SelectSampleType({Key? key, this.clientId, this.clientName})
      : super(key: key);

  @override
  _SelectSampleTypeState createState() => _SelectSampleTypeState();
}

class _SelectSampleTypeState extends State<SelectSampleType> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('Select Sample Type',
            style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: ListView(
          children: [
            Text('Air Quality Analysis',
                style: TextStyle(color: Colors.black, fontSize: 16)),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future:
                    SampleImplementation().getClientsTemplates(widget.clientId),
                builder: (context, AsyncSnapshot snapshot) {
                  Map<String, dynamic>? data = snapshot.data;
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : snapshot.hasData
                          ? Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClientsSample(
                                                      clientId: widget.clientId,
                                                      sampleType: 'fmEnvs',
                                                      clientName:
                                                          widget.clientName,
                                                      templateData:
                                                          data!['returnObject']
                                                              ['fmEnvs'],
                                                    )));
                                      },
                                      child: myListWidget(
                                          data!['returnObject']['fmEnvs'],
                                          'fmEnvs')),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClientsSample(
                                                      clientId: widget.clientId,
                                                      sampleType: 'dpRs',
                                                      clientName:
                                                          widget.clientName,
                                                      templateData:
                                                          data['returnObject']
                                                              ['dpRs'],
                                                    )));
                                      },
                                      child: myListWidget(
                                          data['returnObject']['dpRs'],
                                          'dpRs')),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClientsSample(
                                                      clientId: widget.clientId,
                                                      sampleType: 'nesreAs',
                                                      clientName:
                                                          widget.clientName,
                                                      templateData:
                                                          data['returnObject']
                                                              ['nesreAs'],
                                                    )));
                                      },
                                      child: myListWidget(
                                          data['returnObject']['nesreAs'],
                                          'nesreAs')),
                                ),
                              ],
                            )
                          : Center(
                              child: Text('No template yet for this client'));
                }),
          ],
        ),
      ),
    );
  }

  myListWidget(List type, String name) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!,
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
        BoxShadow(
          offset: Offset(0, 0.5),
        ),
      ], borderRadius: BorderRadius.circular(10), color: Colors.grey.shade300),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
