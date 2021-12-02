import 'package:flutter/material.dart';
import 'package:pams/screens/clients/client_implementation.dart';
import 'package:pams/samples/select_sample_type.dart';

class FieldSampling extends StatefulWidget {
  @override
  _FieldSamplingState createState() => _FieldSamplingState();
}

class _FieldSamplingState extends State<FieldSampling> {
  @override
  void initState() {
    super.initState();
    getClients();
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
        title: Text("Customer List",
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder<Map<String, dynamic>?>(
            future: getClients(),
            builder: (context, snapshot) {
              final client = snapshot.data;

              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ))
                  : snapshot.hasData
                      ? ListView.builder(
                          itemCount: client!['returnObject']['data'].length,
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SelectSampleType(
                                          clientId: client['returnObject']
                                              ['data'][index]['id'],
                                          clientName: client['returnObject']
                                              ['data'][index]['name'],
                                        )));
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
                                    title: Text(
                                        "${client['returnObject']['data'][index]['name'].toString()}"),
                                    subtitle: Text(
                                      "${client['returnObject']['data'][index]['email'].toString()}",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    trailing: InkWell(
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 17,
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
}
