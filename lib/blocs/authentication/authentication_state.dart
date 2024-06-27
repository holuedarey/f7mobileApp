import 'package:equatable/equatable.dart';

import '../../models/secret/secret_model.dart';

abstract class AuthenticationBlocState extends Equatable {

  @override
  List<Object> get props => [];
}

class AuthenticationStateUninitialised extends AuthenticationBlocState {}

class AuthenticationStateShowOnBoarding extends AuthenticationBlocState {}

class AuthenticationStateTimeOut extends AuthenticationBlocState {}

class AuthenticationStateForceUpdate extends AuthenticationBlocState {}

class AuthenticationStateAuthenticated extends AuthenticationBlocState {}

class AuthenticationStateUnAuthenticated extends AuthenticationBlocState {}

enum LoadingStateType { Entry, Loading, Exit }

class AuthenticationStateLoading extends AuthenticationBlocState {
  final String? accessToken;
  final LoadingStateType? type;

  AuthenticationStateLoading({this.accessToken, this.type}) : super();
}

class AuthenticationStateReAuthenticate extends AuthenticationBlocState {
  final String? emailaddress;

  AuthenticationStateReAuthenticate({required this.emailaddress});
}

class AuthenticationStateProfileUpdateCompleted
    extends AuthenticationBlocState {
  final EmployeeData user;

  AuthenticationStateProfileUpdateCompleted({required this.user});
}
