import 'package:equatable/equatable.dart';
import 'package:f7apparel_mobile/models/registration/user_otp_response.dart';

abstract class ForgetPasswordBlocState extends Equatable {
  const ForgetPasswordBlocState([List props = const []]);
}

class ForgetPasswordStateInitialised extends ForgetPasswordBlocState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordStateLoading extends ForgetPasswordBlocState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordStateSuccessful extends ForgetPasswordBlocState {
  final UserOtpResponse userOtpResponse;
  const ForgetPasswordStateSuccessful({required this.userOtpResponse});

  @override
  List<Object> get props => [];
}

class ForgetPasswordStateFailed extends ForgetPasswordBlocState {
  final String? message;
  const ForgetPasswordStateFailed({this.message});

  @override
  List<Object> get props => [];
}

class ChangePasswordStateSuccessful extends ForgetPasswordBlocState {
  final UserOtpResponse userOtpResponse;
  const ChangePasswordStateSuccessful({required this.userOtpResponse});

  @override
  List<Object> get props => [];
}

class VerifyOTPPasswordStateSuccessful extends ForgetPasswordBlocState {
  final UserOtpResponse userOtpResponse;
  const VerifyOTPPasswordStateSuccessful({required this.userOtpResponse});

  @override
  List<Object> get props => [];
}
