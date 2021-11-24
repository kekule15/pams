import 'package:flutter/material.dart';
import 'package:pams/screens/clients/clients_samples.dart';

class SelectSampleType extends StatefulWidget {
  final List? templates;
  final String? clientName;

  const SelectSampleType({Key? key, this.templates,this.clientName}) : super(key: key);

  @override
  _SelectSampleTypeState createState() => _SelectSampleTypeState();
}

class _SelectSampleTypeState extends State<SelectSampleType> {
  @override
  void initState() {
    print(widget.templates);
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
        child: ListView.builder(
            itemCount: widget.templates!.length,
            itemBuilder: (context, index) {
              return widget.templates![index] == null
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ClientsSample(
                                    sampleType: '${widget.templates![index]}',
                                    clientName: widget.clientName,
                                  )));
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey.shade300),
                          child: Center(
                            child: Text(
                              widget.templates![index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
