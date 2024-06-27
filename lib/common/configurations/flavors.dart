import 'app_config.dart';

/// check if it's development flavor of the app
bool isDev() {
  return AppConfig.instance.flavor == Flavor.development;
}

/// check if it's production flavor of the app
bool isProduction() {
  return AppConfig.instance.flavor == Flavor.production;
}

