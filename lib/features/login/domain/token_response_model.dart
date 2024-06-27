
import '../../../models/secret/secret_model.dart';

class TokenResponseModel {
  SecretModel? _token;
  String? _message;

  SecretModel? get token => _token;

  set token(SecretModel? value) {
    _token = value;
  }

  String? get message => _message;

  set message(String? value) {
    _message = value;
  }
}
