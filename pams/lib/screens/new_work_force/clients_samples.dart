import 'package:flutter/material.dart';
import 'package:pams/screens/elementtest.dart';

class ClientsSample extends StatefulWidget {
  final String? sampleType;

  const ClientsSample({Key? key, this.sampleType}) : super(key: key);

  @override
  _ClientsSampleState createState() => _ClientsSampleState();
}

class _ClientsSampleState extends State<ClientsSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Clients name',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          children: [
            Text(widget.sampleType!, style: TextStyle(color: Colors.black)),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ElementTest()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: ListTile(
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 18,
                            ),
                            title: Text(
                              'Samples',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
