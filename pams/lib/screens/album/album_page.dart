import 'package:flutter/material.dart';
import 'package:pams/screens/album/album_class.dart';
import 'package:pams/screens/album/album_implementation.dart';

class MyAbumPage extends StatefulWidget {
  // const MyAbumPage({ Key? key }) : super(key: key);

  @override
  _MyAbumPageState createState() => _MyAbumPageState();
}

class _MyAbumPageState extends State<MyAbumPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
