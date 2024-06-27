import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginBlocEvent extends Equatable {
  // LoginBlocEvent([List props = const []]) : super(props);
  @override
  List<Object> get props => [];
}

class LoginEmailEventButtonPressed extends LoginBlocEvent {
  final BuildContext context;
  final Map<String, dynamic>
      parameters; //Key and value(e.g. username and password)
  final String? accessToken;

  LoginEmailEventButtonPressed(this.context,
      {required this.parameters, this.accessToken});
  // super([parameters]);
}

class LoginPhoneEventButtonPressed extends LoginBlocEvent {
  final BuildContext context;
  final Map<String, dynamic>
  parameters; //Key and value(e.g. username and password)
  final String? accessToken;

  LoginPhoneEventButtonPressed(this.context,
      {required this.parameters, this.accessToken});
// super([parameters]);
}

class LoginErrorEvent extends LoginBlocEvent {
  final BuildContext context;
  final String message;

  LoginErrorEvent(this.context, {required this.message});

}

class LoginWithFacebookEvent extends LoginBlocEvent {
  final Map<String, dynamic>
  parameters; //Key and value(e.g. username and password)
  final String? accessToken;

  LoginWithFacebookEvent(
      {required this.parameters, this.accessToken});
// super([parameters]);
}


class LoginWithGoogleEvent extends LoginBlocEvent {
  final Map<String, dynamic>
  parameters; //Key and value(e.g. username and password)
  final String? accessToken;

  LoginWithGoogleEvent(
      {required this.parameters, this.accessToken});
// super([parameters]);
}