import 'app_config.dart';

enum HantspolUrl {
  identity,
  request,
  sendOTP,
  milestone

}

const Map<HantspolUrl, String>  hantspolUrlTest  = {
  HantspolUrl.identity: 'https://hantspol-api-dev-5f03fb9625da.herokuapp.com/api/v1/',
};

const Map<HantspolUrl, String> hantspolUrlProd = {
  HantspolUrl.identity: 'https://hantspol-api-dev-5f03fb9625da.herokuapp.com/api/v1/',

};

class HantspolUrls {
  static String? getUrl(Flavor? flavour, HantspolUrl url) {
    switch (flavour) {
      case Flavor.development:
        return hantspolUrlTest[url];
      case Flavor.production:
        return hantspolUrlProd[url];
      default:
        return hantspolUrlProd[url];
    }
  }
}
