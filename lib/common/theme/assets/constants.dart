import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// Theme.of(context).appSubTitleColor
extension LightThemeEx on ThemeData {
  Color get appSubTitleColor {
    return Color(0xFF5F6368);
  }
}

// Theme.of(context).colorScheme.actionButtonColor,
extension MyColorScheme on ColorScheme {
  Color get actionButtonColor => Colors.red;
}

class AppPreference {
  static const String AUTHENTICATED = 'AUTHENTICATED';
  static const String AUTH_TOKEN = 'AUTH_TOKEN';
  static const String FCM_TOKEN = 'FCM_TOKEN';
  static const String FIRST_OPEN = 'FIRST_OPEN';
  static const String FINGERPRINT_ENABLED = 'FINGERPRINT_ENABLED';

  static const String PREFERENCE_KEY_LANGUAGE_KEY =
      'PREFERENCE_KEY_LANGUAGE_KEY';

  static const String PREFERENCE_KEY_SESSION_TOKEN =
      'PREFERENCE_KEY_SESSION_TOKEN';
  static const String PREFERENCE_KEY_SESSION_USER_ID =
      'PREFERENCE_KEY_SESSION_USER_ID';
  static const String PREFERENCE_KEY_SESSION_PHONE =
      'PREFERENCE_KEY_SESSION_PHONE';
  static const String PREFERENCE_KEY_SESSION_USERID =
      'PREFERENCE_KEY_SESSION_USERID';
  static const String PREFERENCE_KEY_SESSION_USERNAME =
      'PREFERENCE_KEY_SESSION_USERNAME';
  static const String PREFERENCE_KEY_SESSION_USER =
      'PREFERENCE_KEY_SESSION_USER';
  static const String PREFERENCE_KEY_SESSION_COUNTRY =
      'PREFERENCE_KEY_SESSION_COUNTRY';
  static const String PREFERENCE_KEY_SESSION_LOCK_CODE =
      'PREFERENCE_KEY_SESSION_LOCK_CODE';

  static const String PREFERENCE_KEY_SESSION_PIN = 'PREFERENCE_KEY_SESSION_PIN';
}

class AppStrings {
  static final String appName = 'Wavve';
}

class AppSvgAssets {
  static final String _base = 'assets/svgs';
  static final String uploadProfile = '$_base/profile_upload.svg';
  static final String walletIcon = '$_base/wallet_icon.svg';
  static final String sendMoney = '$_base/send_money_icon.svg';
  static final String requestMoney = '$_base/request_money.svg';
  static final String transaction = '$_base/transactions_icon.svg';
  static final String notification = '$_base/notification.svg';
  static final String notificationNew = '$_base/notification_new.svg';
  static final String homeTab = '$_base/home.svg';
  static final String homeWhiteTab = '$_base/home_white.svg';
  static final String homeInactiveTab = '$_base/home_inactive.svg';
  static final String transactionInactiveTab = '$_base/transaction.svg';
  static final String transactionActiveTab = '$_base/transaction_active.svg';
  static final String transactionWhiteTab = '$_base/transaction_white.svg';
  static final String profileInactiveTab = '$_base/profile.svg';
  static final String profileActiveTab = '$_base/profile_active.svg';
  static final String profileWhiteTab = '$_base/profile_white.svg';
  static final String editProfile = '$_base/edit_profile.svg';
  static final String editSecurity = '$_base/edit_security.svg';
  static final String editCard = '$_base/edit_cards.svg';
  static final String editLogout = '$_base/edit_logout.svg';
  static final String editPasswordIcon = '$_base/edit_password_icon.svg';
  static final String editPinIcon = '$_base/edit_pin_icon.svg';
  static final String checkIcon = '$_base/check.svg';
  static final String checkWhiteIcon = '$_base/check_white.svg';
  static final String generalEmpty = '$_base/general_empty.svg';
  static final String fundCardIcon = '$_base/fund_card_icon.svg';
  static final String fundMobileIcon = '$_base/fund_mobile_icon.svg';
  static final String mSendMoneyIcon = '$_base/m_send_money_icon.svg';
  static final String p2pIcon = '$_base/p2p_icon.svg';
}



class HttpErrorStrings {
  static const String CONNECTION_TIMEOUT_ACTIVE =
      'Unable to make connection at the moment \nthis may be caused by an unstable network \nor connection to the server, please try again later.';

  static const String CONNECTION_TIMEOUT_NOT_ACTIVE =
      'Looks like you have no active connection at the moment,\n please try again when you have an active connection.';

  static const String SEND_TIMEOUT =
      'Looks like you have an unstable network at the moment,\n please try again when network stabilizes.';

  static const String RECEIVE_TIMEOUT =
      'Unable to connect to server at the moment';

  static const String BAD_RESPONSE =
      'Unable to complete request at the moment. Please contact our customer care';

  static const String OPERATION_CANCELLED = 'Operation was cancelled';

  static const String DEFAULT =
      'Looks like you are not connected to any active network.\n Please connect and try again';

  static const String UNKNOWN = 'Unknown error occurred';
  static const String API_GATEWAY_TIMEOUT = 'Endpoint request timed out';
  static const String UNAUTHORIZED = '401 Unauthorized';
}
