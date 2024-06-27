import 'dart:ui';

enum Flavor { development, production }

class AppConfig {
  Flavor? flavor;
  String? name;
  Color? color;

  static final AppConfig _instance = AppConfig._internal();

  static final AppConfig instance = _instance;

  factory AppConfig({Flavor? flavor, String? name, Color? color}) {
    if (_instance.flavor == null) {
      _instance.flavor = flavor;
      _instance.name = name;
      _instance.color = color;
    }
    return _instance;
  }

  AppConfig._internal();

  static bool isProduction() => _instance.flavor != Flavor.development;
}
