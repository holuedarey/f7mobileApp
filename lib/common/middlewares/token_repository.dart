import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum TokenType { ACCESS, REFRESH }

class TokenRepository {
  static final TokenRepository _repository = TokenRepository._internal();
  final _storage = const FlutterSecureStorage();
  final List<String> _keys = ['access', 'refresh'];
  final String phoneKey = "phoneKey";
  final String fcmKey = "fcmKey";
  final String otpKey = "otp";
  final String patternKey = "pattern";
  final String credentialToken = "credentialToken";
  final String fcmTokenUpdated = 'fcm_token_updated';

  factory TokenRepository.getInstance() {
    return _repository;
  }
  TokenRepository._internal();

  Future<void> deleteToken() async {
    await _storage.delete(key: _keys[0]);
    return;
  }

  Future<void> persistToken(Map<TokenType, String?> tokens) async {
    if (tokens.isNotEmpty) {
      tokens.forEach((key, value) async {
        await _storage.write(
            key: (key == TokenType.ACCESS) ? _keys[0] : _keys[1],
            value: value ?? '');
      });
    }
    return;
  }

  Future<void> persistFCMToken(String fcmToken) async {
    if (fcmToken.isNotEmpty) {
      await _storage.write(key: fcmKey, value: fcmToken);
    }
    return;
  }

  Future<String?> getFCMToken() async {
    return await _storage.read(key: fcmKey);
  }

  Future<void> persistPhoneNumber(String phoneNumber) async {
    if (phoneNumber.isNotEmpty) {
      await _storage.write(key: phoneKey, value: phoneNumber);
    }
  }

  Future<void> persistOTP(String otp) async {
    if (otp.isNotEmpty) {
      await _storage.write(key: otpKey, value: otp);
    }
  }

  Future<String?> getOTP() async {
    return await _storage.read(key: otpKey);
  }

  Future<void> persistPattern(dynamic pattern) async {
    if (pattern.isNotEmpty) {
      await _storage.write(key: patternKey, value: pattern);
    }
  }

  Future<String?> getPattern() async {
    return await _storage.read(key: patternKey);
  }

  Future<void> persistCredentialToken(String credentialToken) async {
    if (credentialToken.isNotEmpty) {
      await _storage.write(key: credentialToken, value: credentialToken);
    }
  }

  Future<String?> getPhoneNumber() async {
    return await _storage.read(key: phoneKey);
  }

  Future<String?> getCredentialToken() async {
    return await _storage.read(key: credentialToken);
  }

  Future<bool> hasToken(TokenType type) async {
    String token = await _storage.read(
            key: (type == TokenType.ACCESS) ? _keys[0] : _keys[1]) ??
        '';

    return (token.isNotEmpty);
  }

  Future<String?> getToken(TokenType type) async {
    if (type == TokenType.ACCESS) {
      return await _storage.read(key: _keys[0]);
    }
    if (type == TokenType.REFRESH) {
      return await _storage.read(key: _keys[1]);
    }

    return '';
  }

  //
  // Future<bool> hasFcmTokenUpdated(String token) async {
  //   String fcmToken = await _storage.read(key:token ?? '');
  //
  //   return (fcmToken.isNotEmpty);
  // }

  //
  // // bool get tokenUpdated => _storage.read(fcmTokenUpdated) ?? false;
  // bool get tokenUpdated =>  _storage.read(key: fcmTokenUpdated); ?? false;
  //
  // set tokenUpdated(bool value) =>
  //     sharedPreferences.setBool(KEY_TOKEN_UPDATED, value);
}
