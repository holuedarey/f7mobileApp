import 'package:flutter/material.dart';
class AppProvider extends ChangeNotifier {
  AppProvider() {
    getPreferredTheme();
    // user = null;
  }

  Key key = UniqueKey();
  bool? isDarkTheme;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }


  void setTheme(bool theme) {
    isDarkTheme = theme;
    notifyListeners();
  }


  Future savePreferredTheme(bool theme) async {
    setTheme(theme);
  }

  void getPreferredTheme() {
    isDarkTheme = true;
  }
}