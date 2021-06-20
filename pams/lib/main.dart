import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pams/routes/route_generator.dart';
import 'package:pams/routes/routes.dart';
import 'package:pams/screens/splashScreen.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();



  
   SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((val) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
           initialRoute: Routes.splash,
onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
