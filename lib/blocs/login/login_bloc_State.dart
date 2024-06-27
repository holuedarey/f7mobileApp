import 'package:equatable/equatable.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState([List props = const []]);
}

class LoginStateInitialised extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class LoginStateLoading extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class LoginStateSuccessful extends LoginBlocState {
  final String accessToken;
  const LoginStateSuccessful({required this.accessToken});

  @override
  List<Object> get props => [];
}
class LoginStateFailed extends LoginBlocState {
  final String? message;
  const LoginStateFailed({this.message});

  @override
  List<Object> get props => [];
}

