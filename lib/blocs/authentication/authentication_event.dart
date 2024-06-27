import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../models/registration/user_otp_response.dart';
import '../../models/secret/secret_model.dart';

abstract class AuthenticationBlocEvent extends Equatable {}

class AuthenticationEventAppStated extends AuthenticationBlocEvent {
  // final BuildContext context;
  // final String accessToken;
  // AuthenticationEventAppStated(this.context, {required this.accessToken});
  @override
  List<Object> get props => [];
}

class AuthenticationEventShowOnBoarding extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventOnBoardingComplete extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventTimeOut extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventAppInactive extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventAppResumed extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventProfileUpdateCompleted
    extends AuthenticationBlocEvent {
  final BuildContext context;
  final EmployeeData user;

  AuthenticationEventProfileUpdateCompleted(this.context, {required this.user});

  @override
  List<Object> get props => [];
}

class AuthenticationEventSignedIn extends AuthenticationBlocEvent {
  final BuildContext context;
  final String accessToken;

  final RegisterUserResponse? registerUserResponse;
  final CreateAccountResponse? createAccountResponse;
  final String? accessPin;
  final String? email;
  final String? password;

  AuthenticationEventSignedIn(this.context, {required this.accessToken, this.registerUserResponse, this.createAccountResponse, this.accessPin, this.email,this.password});
  // super([accessToken]);

  @override
  List<Object> get props => throw UnimplementedError();
}

class AuthenticationEventForceUpdate extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventSignedOut extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}
