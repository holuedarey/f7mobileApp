
part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String message;
  SignUpErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}


class  VerifyInviteSuccessState extends  SignUpState {
  final InvitationResponse invitationResponse;

  VerifyInviteSuccessState({
    required this.invitationResponse,
  });

  @override
  List<Object?> get props =>
      [
        invitationResponse,
      ];
}


class  SignUpSuccessState extends  SignUpState {
  final RegisterUserResponse registerUserResponse;

  SignUpSuccessState({
    required this.registerUserResponse,
  });

  @override
  List<Object?> get props =>
      [
        registerUserResponse,
      ];
}


class  CreateAccountProfileSuccessState extends  SignUpState {
  final CreateAccountResponse createAccountResponse;

  CreateAccountProfileSuccessState({
    required this.createAccountResponse,
  });

  @override
  List<Object?> get props =>
      [
        createAccountResponse,
      ];
}

class  CreateAccessPinSuccessState extends  SignUpState {
  final CreateAccessPinResponse createAccessPinResponse;
  CreateAccessPinSuccessState({
    required this.createAccessPinResponse,
  });

  @override
  List<Object?> get props =>
      [
        createAccessPinResponse,
      ];
}