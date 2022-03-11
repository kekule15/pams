import 'package:flutter/material.dart';
import 'package:pams/screens/clients/client_implementation.dart';
import 'package:pams/samples/select_sample_type.dart';
import 'package:pams/screens/homepage.dart';
import 'package:pams/utils/list_widget.dart';

import 'add_customer.dart';
import 'location/client_location.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  void initState() {
    super.initState();
    getClients();
  }

  Map<String, dynamic>? customers;

  Future<Map<String, dynamic>?> getClients() async {
    final result = await ClientImplementation().getAllClients();
    if (result != null) {
      setState(() {
        customers = result;
      });
    }
    return result;
  }

  Future<bool> onclick() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeView()));

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onclick,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              onclick();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddCustomerPage()));
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
          title: Text("Customer List",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search Customers',
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
            customers == null
                ? Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
                  )
                : customers!['returnObject']['data'].length == 0
                    ? Center(
                        child: Text('No Customers Yet'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: customers!['returnObject']['data'].length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ClientLocation(
                                        clientId: customers!['returnObject']
                                            ['data'][index]['id'],
                                        clientName: customers!['returnObject']
                                            ['data'][index]['name'],
                                      )));
                            },
                            child: ListWidget(
                              title: customers!['returnObject']['data'][index]
                                  ['name'],
                              subTitle: customers!['returnObject']['data']
                                  [index]['email'],
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                              ),
                            ),
                          );
                        })
          ],
        ),
      ),
    );
  }
}
