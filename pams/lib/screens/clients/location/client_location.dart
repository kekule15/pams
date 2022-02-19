import 'package:flutter/material.dart';
import 'package:pams/samples/select_sample_type.dart';
import 'package:pams/screens/clients/location/add_location.dart';
import 'package:pams/utils/custom_colors.dart';
import 'package:pams/utils/list_widget.dart';

class ClientLocation extends StatefulWidget {
  final String? clientName;
  final String? clientId;

  const ClientLocation({Key? key, this.clientName, this.clientId})
      : super(key: key);

  @override
  _ClientLocationState createState() => _ClientLocationState();
}

class _ClientLocationState extends State<ClientLocation> {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddLocation()));
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Customer Location",
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      backgroundColor: CustomColors.background,
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search Locations',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectSampleType(
                              clientId: widget.clientId,
                              clientName: widget.clientName,
                            )));
                  },
                  child: ListWidget(
                    title: 'Sampling point $index',
                    subTitle: 'Lagos',
                    trailing: Icon(Icons.delete),
                  ),
                );
              })
        ],
      ),
    );
  }
}
