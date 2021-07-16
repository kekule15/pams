import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/models/api_response_model.dart';
import 'package:pams/models/other_model/client_model.dart';
import 'package:pams/screens/client.dart';
import 'package:pams/services/api_services/repositories/clients_repository.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:pams/widgets/client_placeholder.dart';
import 'package:http/http.dart' as http;

class FieldSampling extends StatefulWidget {
  @override
  _FieldSamplingState createState() => _FieldSamplingState();
}

class _FieldSamplingState extends State<FieldSampling> {
  Future<ClientModel> getAllClients() async {
    String token = await Prefs.instance.getStringValue('token');

    // or new Dio with a BaseOptions instance.
    var options = BaseOptions(
      baseUrl: 'http://sethlab-001-site1.itempurl.com',
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    Dio dio = Dio(options);
    final response = await dio.get(
      '/api/v1/Client/GetAllClient',
      options: Options(method: 'GET'),
    );
    if (response.statusCode == 200) {
      var body = response.data;
      ClientModel data = ClientModel.fromJson(body);
      print(data.toString());
      return data;
    } else {
      throw Exception('Failed to load Clients');
    }
  }

  late Future<ClientModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getAllClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: HexColor("#26E07F"),
        title: Text("Conduct a test",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.white,
            size: 35,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder<ClientModel?>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("======my data ${snapshot.data} =====");
              return ListView.builder(
                  itemCount: snapshot.data?.returnObject.length,
                  itemBuilder: (BuildContext context, index) {
                    final client = snapshot.data?.returnObject[index];
                    return Card(child: Text(client!.name));
                  });
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("${snapshot.error}===na error o");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),

      // Center(
      //   child: MaterialButton(
      //     onPressed: () async {
      //       getAllClient();
      //     },
      //     child: Text('Click'),
      //   ),
      // )
      // body: ListView.builder(
      //     itemCount: 5,
      //     itemBuilder: (context, int) {
      //       return ClientPlaceholder(
      //         title: 'loading',
      //         amount: '300',
      //         subtitle: '',
      //       );
      // return Container(
      //   margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      //   height: 70,
      //   width: MediaQuery.of(context).size.width / 1.4,
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       // to make elevation
      //       BoxShadow(
      //         color: Colors.grey[300],
      //         offset: Offset(0, 2),
      //         blurRadius: 4,
      //       ),
      //       // to make the coloured border
      //       BoxShadow(
      //         color: HexColor("#072468"),
      //         offset: Offset(0, 0.5),
      //       ),
      //     ],
      //     color: Colors.white,
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      //     child: ListTile(
      //       title: Text("Flour Mill",
      //           style: TextStyle(
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //               color: HexColor("#072468"))),
      //       subtitle: Text("Lagos",
      //           style: TextStyle(
      //               fontSize: 12, color: HexColor("#072468"))),
      //       trailing: InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => Client()));
      //         },
      //         child: Icon(Icons.arrow_forward_ios_sharp,
      //             color: HexColor("#F58E34")),
      //       ),
      //     ),
      //   ),
      // );
      // })
    );
  }
}
