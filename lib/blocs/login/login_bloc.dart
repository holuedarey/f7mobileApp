import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';
import '../../models/secret/secret_model.dart';
import '../../services/identity_service.dart';
import '../../common/middlewares/tdm_storage.dart';
import 'login_bloc_State.dart';
import 'login_bloc_event.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginStateInitialised()) {
    on<LoginEmailEventButtonPressed>((event, emit) async {
      HantspolStorage userRepository = HantspolStorage.getInstance();

      emit(LoginStateLoading());
      try {
        Tuple2<UserDataResponse?, String?> response =
        await IdentityService.loginEmailUser(event.context, parameters: event.parameters,);

        if (response.item1 != null) {
          await userRepository.createUserData(response.item1!);
          await userRepository.insertEmail(event.parameters['username']);
          await userRepository.insertPassword(event.parameters['password']);
          String accessToken = response.item1!.user.token;
          emit(LoginStateSuccessful(accessToken: accessToken));
        } else {
          emit(LoginStateFailed(message: response.item2));
        }
      } catch (e) {
        emit(const LoginStateFailed(message: "Something went wrong!"));
      }
    });

  }
}
