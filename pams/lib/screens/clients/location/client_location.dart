import 'package:flutter/material.dart';
import 'package:pams/samples/select_sample_type.dart';
import 'package:pams/screens/clients/customerList.dart';
import 'package:pams/screens/clients/location/add_location.dart';
import 'package:pams/screens/clients/location/edit_location.dart';
import 'package:pams/screens/clients/location/implementation.dart';
import 'package:pams/utils/constants.dart';
import 'package:pams/utils/custom_colors.dart';
import 'package:pams/utils/list_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/get_location_response.dart';

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
  void initState() {
    super.initState();
    getLocation();
  }

  LocationResponseModel? myLocations;
  Future getLocation() async {
    final result =
        await LocationImplementation().getClientLocation(widget.clientId);
    if (result != null) {
      setState(() {
        myLocations = result;
      });
    }
  }

  Future<bool> onclick() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CustomerList()));

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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddLocation(clientID: widget.clientId,)));
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
        body: myLocations == null
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                      color: CustomColors.mainDarkGreen),
                ),
              )
            : myLocations!.returnObject!.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No Locations yet'),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                           onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddLocation(clientID: widget.clientId,)));
                },
                            child: Text(
                          'Create one',
                          style: TextStyle(
                              color: CustomColors.mainDarkGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp),
                        ))
                      ],
                    ),
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                          itemCount: myLocations!.returnObject!.length,
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
                                title: myLocations!.returnObject![index].name,
                                subTitle: myLocations!
                                    .returnObject![index].description,
                                trailing: SizedBox(
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditLocation(
                                                          clientID:
                                                              widget.clientId,
                                                          name: myLocations!
                                                              .returnObject![
                                                                  index]
                                                              .name,
                                                          description:
                                                              myLocations!
                                                                  .returnObject![
                                                                      index]
                                                                  .description,
                                                          locatoionId: myLocations!
                                                              .returnObject![
                                                                  index]
                                                              .sampleLocationId,
                                                        )));
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: CustomColors.mainDarkGreen,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            deleteLocationDialog(myLocations!
                                                .returnObject![index]
                                                .sampleLocationId!);
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  ),
      ),
    );
  }

  bool delete = false;

  void deleteLocationDialog(int id) {
    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              child: delete
                  ? Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: CustomColors.mainDarkGreen,
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Delete Location'),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Sure you wanna delete this location?',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                setState(() {
                                  delete = true;
                                });
                                final result = await LocationImplementation()
                                    .deleteClientLocation(id)
                                    .catchError((onError) {
                                  setState(() {
                                    delete = false;
                                  });
                                  Constants().notify(
                                      'Oops...Something went wrong. Try again later');
                                });
                                if (result != null) {
                                  await getLocation();
                                  setState(() {
                                    delete = false;
                                  });
                                  Constants().notify(result.message!);
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    delete = false;
                                  });
                                  Constants().notify(result!.message!);
                                }
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
          );
        });
      },
    );
  }
}
