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
  Future<ReturnObject> getAllClients() async {
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
    //print(response.data);
    // final response = await http.get(
    //   Uri.parse(
    //       'http://sethlab-001-site1.itempurl.com/api/v1/Client/GetAllClient'),
    //   // Send authorization headers to the backend.
    //   headers: {
    //     HttpHeaders.authorizationHeader: token,
    //   },
    // );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.data);
      Map<String, dynamic> jsonData = response.data;
      return ReturnObject.fromJson(jsonData);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Clients');
    }
  }

  Future<ReturnObject> futureAlbum;

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
        child: FutureBuilder<ReturnObject>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              List<ReturnObject> clients = snapshot.data as List<ReturnObject>;
              print(clients);
              return ListView.builder(
                  itemCount: clients.length,
                  itemBuilder: (BuildContext context, index) {
                    var client = clients[index];
                    return Container(
                      child: ListTile(
                        title: Text(client.email),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error} thats it");
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
