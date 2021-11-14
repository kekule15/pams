import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pams/screens/clients/client_implementation.dart';
import 'package:pams/screens/select_sample_type.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:shimmer/shimmer.dart';

class FieldSampling extends StatefulWidget {
  @override
  _FieldSamplingState createState() => _FieldSamplingState();
}

class _FieldSamplingState extends State<FieldSampling> {
  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>?> getClients() async {
    final result = await ClientImplementation().getAllClients();
    return result;
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
        //backgroundColor: HexColor("#26E07F"),
        title: Text("Conduct a test",
            style: TextStyle(color: Colors.black, fontSize: 20)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder<Map<String, dynamic>?>(
            future: getClients(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ))
                  : snapshot.hasData
                      ? ListView.builder(
                          itemCount: 7,
                          itemBuilder: (BuildContext context, index) {
                            final client = snapshot.data;
                            // final client_id = client!.id;
                            // final client_name = client.name;
                            // print('my sample lenght is========');
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SelectSampleType()));
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => ClientSamples(
                                //           client_id: client_id,
                                //           client_name: client_name,
                                //         )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      // to make elevation
                                      BoxShadow(
                                        color: Colors.grey[300]!,
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                      ),
                                      // to make the coloured border
                                      BoxShadow(
                                        
                                        offset: Offset(0, 0.5),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    title: Text("client.name"),
                                    trailing: InkWell(
                                      child: Icon(Icons.arrow_forward_ios_sharp,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Text('No Client available'),
                        );
            }),
      ),
    );
  }

  Widget loader() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Expanded(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 48.0,
                    height: 48.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: 40.0,
                          height: 8.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
