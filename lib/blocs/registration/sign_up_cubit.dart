import 'package:bloc/bloc.dart';
import 'package:tuple/tuple.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f7apparel_mobile/models/registration/user_otp_response.dart';
import 'package:f7apparel_mobile/services/identity_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());



  void verifyInvitationCode(Map<String, dynamic> payload) async {
    emit(SignUpLoadingState());
    try {
      Tuple2<InvitationResponse?, String?> response =
      await IdentityService.verifyInvitationRequest(parameters: payload);
      if (response.item1 != null) {
        emit(VerifyInviteSuccessState(invitationResponse: response.item1!));
      } else {
        emit(SignUpErrorState(
            message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(SignUpErrorState(message: "Something went wrong!"));
    }
  }



  // void verifyUserOTP(Map<String, dynamic> payload) async {
  //   emit(SignUpLoadingState());
  //   try {
  //     Tuple2<UserOtpResponse?, String?> response = await IdentityService.verifyUserOTPRequest(parameters: payload);
  //     if (response.item1 != null) {
  //       emit(SignUpSuccessState(userOtpResponse: response.item1!));
  //     } else {
  //       emit(SignUpErrorState(
  //           message: response.item2 ?? 'an error occurred!!!'));
  //     }
  //   } catch (e) {
  //     emit(SignUpErrorState(message: "Something went wrong!"));
  //   }
  // }

  void registerUser(Map<String, dynamic> payload, String tenantId) async {
    emit(SignUpLoadingState());
    try {
      Tuple2<RegisterUserResponse?, String?> response = await IdentityService.registerUserRequest(parameters: payload, tenantId:tenantId);

      if (response.item1 != null) {

        emit(SignUpSuccessState(registerUserResponse: response.item1!));
      } else {
        emit(SignUpErrorState(message: "${response.item2}"));
      }
    } catch (e) {
      emit(SignUpErrorState(message: "Something went wrong!"));
    }
  }


  void createAccountProfile({required Map<String, dynamic> payload, required String tenantId, required String token}) async {
    emit(SignUpLoadingState());
    try {
      Tuple2<CreateAccountResponse?, String?> response =
      await IdentityService.createAccountProfileRequest(parameters: payload,tenantId:tenantId, token:token );
      if (response.item1 != null) {
        emit(CreateAccountProfileSuccessState(createAccountResponse: response.item1!));
      } else {
        emit(SignUpErrorState(
            message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(SignUpErrorState(message: "Something went wrong!"));
    }
  }


  void createAccessPin({required Map<String, dynamic> payload, required String tenantId, required String token}) async {
    emit(SignUpLoadingState());
    try {
      Tuple2<CreateAccessPinResponse?, String?> response = await IdentityService.createAccessPinRequest(parameters: payload, tenantId:tenantId, token: token);

      if (response.item1 != null) {

        emit(CreateAccessPinSuccessState(createAccessPinResponse: response.item1!));
      } else {
        emit(SignUpErrorState(message: "${response.item2}"));
      }
    } catch (e) {
      emit(SignUpErrorState(message: "Something went wrong!"));
    }
  }

}
