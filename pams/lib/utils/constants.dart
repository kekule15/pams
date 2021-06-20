//AUTHOR: EWANFO LUCKY PETER

import 'dart:math';

class Constants {
  //ADD MORE BASE_URL AND EDIT API_SUB_ENPOINT IF API CHANGES IN FUTURE
  static const String base_url = "http://chikahenry-001-site1.itempurl.com";
  static const String base_url2 = "https://api.food2pot.com";
  static const String base_url3 =
      "https://app.food2pot.com"; //SWAP BASE_URL_3 FOR BASE_URL_4
  static const String base_url4 = "https://app.food2pot.com";

  static const Map<String, String> api_sub_endpoint = {
    "login": base_url + "/api/v1/Account/SignIn",
    "registration": base_url + "/api/v1/Account/SignUp",
    "update_profile": base_url2 + "/api/v1/user_profile",
    "reset_password": base_url2 + "/api/v1/forgot",
   
  };

  static const network_call_duration = const Duration(seconds: 30);

  //THIS IS THE BASE HEADER FOR EVERY POST REQUEST.
  //POPULATE THIS MAP WITH ANY CUSTOM HEADERS DURING CALL.
  static const Map<String, String> api_header = {
    "Content-Type": "appliction/json",
    "Accept": "*/*"
  };

  static const String googleKey = 'AIzaSyCXbx6asbtvpllrqfmWEmhnoQUUbQnIKrE';

  //PAYMENT
  static const String paystackKey =
      "pk_test_25e249297133695de0f477d314a9d2658c967446";
  // "pk_live_4b19d7a93a939e8b2937cef7e609a1bc18cb3dee";

  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  static String getPaymentReference() {
    final String alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    var time = DateTime.now();
    final String characters = "0123456789$alpha${time.millisecondsSinceEpoch}";
    var rnd = new Random();
    // Format "ED{16 RANDOM CHARACTERS}{MINUTE_SECOND}{TWO RANDOM LETTERS}"

    var sb = new StringBuffer('ED');
    for (int i = 0; i < 16; i++) {
      sb.write(characters[(rnd.nextInt(characters.length))]);
    }
    sb.write('${time.minute}${time.second}');
    for (int i = 0; i < 2; i++) {
      sb.write(alpha[(rnd.nextInt(alpha.length))]);
    }
    return sb.toString();
  }

  static List sidebar_lists = [
    {
      "title": "Dashboard",
      "img_url": 'assets/images/dashboard.svg',
    },
    {
      "title": "History",
      "img_url": 'assets/images/history_.svg',
    },
    {
      "title": "Support",
      "img_url": 'assets/images/support.svg',
    },
    {
      "title": "About",
      "img_url": 'assets/images/about-icon.svg',
    },
    {
      "title": "Logout",
      "img_url": 'assets/images/log-out.svg',
    },
  ];

  // Lagos bounding box
  static const double lagosNorth = 6.697265;
  static const double lagosSouth = 6.371339;
  static const double lagosEast = 4.350063;
  static const double lagosWest = 2.701359;

  // Abuja bounding box
  static const double abujaNorth = 9.1881;
  static const double abujaSouth = 8.77083;
  static const double abujaEast = 7.6934;
  static const double abujaWest = 6.7804;

  // Wallet
  static const double maxWalletBalance = 50000;
  static const double minWalletBalance = 2000;
}
