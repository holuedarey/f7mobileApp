import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';

bool forceEnableDebug = false;

/// Go back to previous screen.
void finish(BuildContext context, [Object? result]) {
  if (Navigator.canPop(context)) Navigator.pop(context, result);
}

/// Go to new screen with provided screen tag.
///
/// ```dart
/// launchNewScreen(context, '/HomePage');
/// ```
Future<T?> launchNewScreen<T>(BuildContext context, String tag) async =>
    Navigator.of(context).pushNamed(tag);

/// Removes all previous screens from the back stack and redirect to new screen with provided screen tag
///
/// ```dart
/// launchNewScreenWithNewTask(context, '/HomePage');
/// ```
Future<T?> launchNewScreenWithNewTask<T>(
        BuildContext context, String tag) async =>
    Navigator.of(context).pushNamedAndRemoveUntil(tag, (r) => false);

List<String> getImageURL(String? rawUrl) {
  if (rawUrl != null) {
    final extractedURLS = rawUrl.split(',');
    List<String> splitList = [];
    for (int i = 0; i < extractedURLS.length; i++) {
      splitList.add(
          "https://csb1003200273b187ce.blob.core.windows.net/filestorage/ProductImage${extractedURLS[i]}");
    }
    return splitList;
  }
  return [];
}

List<XFile>? imageFileList = [];

List<String> getImagePaths(List<XFile>? imageFileList) {
  if (imageFileList != null) {
    List<String> splitList = [];
    for (int s = 0; s < imageFileList.length; s++) {
      splitList.add(imageFileList[s].path);
    }
    return splitList;
  }
  return [];
}

/// Dark Status Bar
void setDarkStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
}

/// Light Status Bar
void setLightStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));
}

/// This function will show status bar
Future<void> showStatusBar() async {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
}

// Enter FullScreen Mode (Hides Status Bar and Navigation Bar)
void enterFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

// Unset Full Screen to normal state (Now Status Bar and Navigation Bar Are Visible)
void exitFullScreen() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
}

/// This function will hide status bar
Future<void> hideStatusBar() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

/// Set orientation to portrait
void setOrientationPortrait() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

/// Set orientation to landscape
void setOrientationLandscape() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

/// Custom scroll behaviour
Widget Function(BuildContext, Widget?)? scrollBehaviour() {
  return (context, child) {
    return ScrollConfiguration(behavior: SBehavior(), child: child!);
  };
}

/// Custom scroll behaviour widget
class SBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

/// Invoke Native method and get result
Future<T?> invokeNativeMethod<T>(
  String channel,
  String method, [
  dynamic arguments,
]) async {
  var platform = MethodChannel(channel);
  return await platform.invokeMethod<T>(method, arguments);
}

/// Prints only if in debug or profile mode
void devLog(Object? value) {
  if (!kReleaseMode || forceEnableDebug) log("devLog:$value");
}

/// use this for catchError in Future functions
Future<Null> onError(Object o) async {
  devLog(o.toString());
}

const defaultDuration = Duration(milliseconds: 250);

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
