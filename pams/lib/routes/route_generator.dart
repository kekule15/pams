import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pams/authentication/auth.dart';
import 'package:pams/authentication/forgotpassword.dart';
import 'package:pams/authentication/login.dart';
import 'package:pams/authentication/register.dart';
import 'package:pams/routes/routes.dart';
import 'package:pams/screens/fieldsampling.dart';
import 'package:pams/screens/homepage.dart';
import 'package:pams/screens/notification.dart';
import 'package:pams/screens/profile.dart';
import 'package:pams/screens/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(
          builder: (context) => SplashScreen(),
        );
        break;
      // case Routes.onboarding:
      //   return CupertinoPageRoute(
      //     builder: (context) => OnboardingScreen(),
      //   );
      //   break;
      case Routes.login:
        print("HELLO WORLD !!! HOW ARE YOU");
        return CupertinoPageRoute(
          builder: (context) => LoginPage(),
        );
        break;
      case Routes.home:
        return CupertinoPageRoute(
          builder: (context) => HomePage(currentPage: 0),
        );
      case Routes.signupLogin:
        return CupertinoPageRoute(
          builder: (context) => RegisterPage(),
        );

      case Routes.resetPassword:
        return CupertinoPageRoute(
          builder: (context) => ForgotPassword(),
        );
      // case Routes.recommendedScreens:
      //   // NavRecommendedScreenModel navRecommendedScreenModel = args;
      //   return CupertinoPageRoute(
      //     builder: (context) => RecommendedScreen(
      //       navRecommendedScreenModel: navRecommendedScreenModel,
      //     ),
      //   );
      case Routes.profileScreen:
        return CupertinoPageRoute(
          builder: (context) => ProfilePage(),
        );
      case Routes.fieldSampling:
        return CupertinoPageRoute(
          builder: (context) => FieldSampling(),
        );
      case Routes.viewActivity:
        return CupertinoPageRoute(
          builder: (context) => HomePage(currentPage: 1),
        );

      case Routes.register:
        return CupertinoPageRoute(
          builder: (context) => RegisterPage(),
        );
         case Routes.notification:
        return CupertinoPageRoute(
          builder: (context) => NotificationPage(),
        );
         case Routes.authPage:
        return CupertinoPageRoute(
          builder: (context) => AuthPage(),
        );

      default:
        break;
    }
  }
}
