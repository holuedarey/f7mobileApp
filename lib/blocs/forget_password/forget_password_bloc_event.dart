import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ForgetPasswordBlocEvent extends Equatable {
  // ForgetPasswordBlocEvent([List props = const []]) : super(props);
  @override
  List<Object> get props => [];
}

class ForgetPasswordEventButtonPressed extends ForgetPasswordBlocEvent {

  final String emailAddress ;

  ForgetPasswordEventButtonPressed(
      {required this.emailAddress});

}

class ForgetPasswordErrorEvent extends ForgetPasswordBlocEvent {
  final BuildContext context;
  final String message;

  ForgetPasswordErrorEvent(this.context, {required this.message});

}

class ResetPasswordEvent extends ForgetPasswordBlocEvent {
  final Map<String, dynamic>
  parameters; //Key and value(e.g. username and password)

  ResetPasswordEvent(
      {required this.parameters});
}


class VerifyOTPPasswordEvent extends ForgetPasswordBlocEvent {
  final Map<String, dynamic>
  parameters;

  VerifyOTPPasswordEvent(
      {required this.parameters});
}

class ChangePasswordEvent extends ForgetPasswordBlocEvent {
  final String userId ;
  final Map<String, dynamic>
  parameters; //Key and value(e.g. username and password)

  ChangePasswordEvent(
      {required this.userId, required this.parameters});
}


