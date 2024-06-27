// import 'package:f7apparel_mobile/myapp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:async';

import 'package:f7apparel_mobile/common/configurations/app_config.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {

  mainSetup(Flavor.development);
}

String getFlavourName(Flavor flavor) {
  switch (flavor) {
    case Flavor.development:
      return "Dev:Hantspol";
    case Flavor.production:
      return "Prod:Hantspol";
    default:
      return "Prod:Hantspol";
  }
}

mainSetup(Flavor flavor) async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  //Since dart runs on Single isolate, you can capture errors directly with Zone using "runZonedGuarded"
  await runZonedGuarded(
        () async {
      AppConfig(
        flavor: flavor,
        name: getFlavourName(flavor),
        color: const Color(0xFFFD8D9B),
      );

      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight]);
      runApp(const F7App());
    },
        (error, stackTrace) {
      FlutterError.dumpErrorToConsole(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
        ),
        forceReport: true,
      );
    },
  );
}
