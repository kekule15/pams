import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/models/api_response_model.dart';
import 'package:pams/models/other_model/client_model.dart';
import 'package:pams/screens/client_samples.dart';
import 'package:pams/services/api_services/repositories/clients_repository.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:pams/widgets/client_placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

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
              print("======my data ${snapshot.data!.returnObject} =====");
              return ListView.builder(
                  itemCount: snapshot.data?.returnObject.length,
                  itemBuilder: (BuildContext context, index) {
                    final client = snapshot.data?.returnObject[index];
                    final client_id = client!.id;
                    final client_name = client.name;
                    print('my sample lenght is========');
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ClientSamples(client_id: client_id, client_name:client_name ,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              // to make elevation
                              BoxShadow(
                                color: Colors.grey[300]!,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                              // to make the coloured border
                              BoxShadow(
                                color: HexColor("#072468"),
                                offset: Offset(0, 0.5),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: ListTile(
                            title: Text(client.name),
                            trailing: InkWell(
                              child: Icon(Icons.arrow_forward_ios_sharp,
                                  color: HexColor("#F58E34")),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("${snapshot.error}===na error o");
            }

            // By default, show a loading spinner.
            return loader();
          },
        ),
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
