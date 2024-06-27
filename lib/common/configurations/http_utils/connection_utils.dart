import 'dart:io';

// import 'package:connectivity/connectivity.dart';

class ConnectionUtils {
  static Future<bool> getActiveStatus() async {
    try {
      // var connectivityResult = await (Connectivity().checkConnectivity());
      final result = await InternetAddress.lookup('google.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty && connectivityResult != ConnectivityResult.none) {
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {}
    return false;
  }
}


