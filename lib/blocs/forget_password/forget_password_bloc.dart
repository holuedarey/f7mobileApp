import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f7apparel_mobile/models/registration/user_otp_response.dart';
import 'package:tuple/tuple.dart';
import '../../services/identity_service.dart';
import '../../common/middlewares/tdm_storage.dart';
import 'forget_password_bloc_State.dart';
import 'forget_password_bloc_event.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordBlocEvent, ForgetPasswordBlocState> {
  ForgetPasswordBloc() : super(ForgetPasswordStateInitialised()) {
    on<ForgetPasswordEventButtonPressed>((event, emit) async {
      HantspolStorage userRepository = HantspolStorage.getInstance();
      emit(ForgetPasswordStateLoading());
      try {
        Tuple2<UserOtpResponse?, String?> response =
            await IdentityService.forgetPasswordRequest(
                email: event.emailAddress);
        if (response.item1 != null) {
          // await userRepository.insertEmail(event.parameters['email']);
          // await userRepository.insertPassword(event.parameters['password']);
          // userRepository.createUser(response.item1!.responseData!.userDetail!);
          // String accessToken = response.item1!.responseData!.token!;
          // emit(ForgetPasswordStateLoading());
          emit(ForgetPasswordStateSuccessful(userOtpResponse: response.item1!));
        } else {
          emit(ForgetPasswordStateFailed(message: response.item2));
        }
      } catch (e) {
        emit(const ForgetPasswordStateFailed(message: "Something went wrong!"));
      }
    });

    on<VerifyOTPPasswordEvent>((event, emit) async {
      emit(ForgetPasswordStateLoading());
      try {
        Tuple2<UserOtpResponse?, String?> response =
            await IdentityService.verifyPasswordOTPRequest(
                parameters: event.parameters);
        if (response.item1 != null) {
          emit(VerifyOTPPasswordStateSuccessful(userOtpResponse: response.item1!));
        } else {
          emit(ForgetPasswordStateFailed(message: response.item2));
        }
      } catch (e) {
        emit(const ForgetPasswordStateFailed(message: "Something went wrong!"));
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      emit(ForgetPasswordStateLoading());
      try {
        Tuple2<UserOtpResponse?, String?> response =
            await IdentityService.resetPasswordRequest(
                parameters: event.parameters);
        if (response.item1 != null) {
          emit(ChangePasswordStateSuccessful(userOtpResponse: response.item1!));
        } else {
          emit(ForgetPasswordStateFailed(message: response.item2));
        }
      } catch (e) {
        emit(const ForgetPasswordStateFailed(message: "Something went wrong!"));
      }
    });
    on<ChangePasswordEvent>((event, emit) async {
      emit(ForgetPasswordStateLoading());
      try {
        Tuple2<UserOtpResponse?, String?> response =
        await IdentityService.changePasswordRequest(
            parameters: event.parameters, userId: event.userId);
        if (response.item1 != null) {
          emit(ChangePasswordStateSuccessful(userOtpResponse: response.item1!));
        } else {
          emit(ForgetPasswordStateFailed(message: response.item2));
        }
      } catch (e) {
        emit(const ForgetPasswordStateFailed(message: "Something went wrong!"));
      }
    });
  }
}
