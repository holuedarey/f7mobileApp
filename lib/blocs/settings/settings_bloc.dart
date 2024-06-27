import 'package:f7apparel_mobile/blocs/settings/settings_event.dart';
import 'package:f7apparel_mobile/blocs/settings/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/middlewares/tdm_storage.dart';
import '../blocs.dart';
import '../../models/secret/secret_model.dart';

class SettingsBloc extends Bloc<SettingsBlocEvent, SettingsBlocState> {
  final HantspolStorage _userRepository = HantspolStorage.getInstance();

  SettingsBloc() : super(SettingsStateInitialised());

  @override
  Stream<SettingsBlocState> mapEventToState(SettingsBlocEvent event) async* {
    if (event is SettingsEventInitialised) {
      yield SettingsStateLoading();
      UserDataResponse? user = await _userRepository.getUserData();
      if (user == null) {
        yield SettingsStateFailed();
      }
      if (user != null) {
        // yield SettingsStateCompleted(user: user);
      }
    }

    // if (event is SettingsEventEditDetailsSaveButtonPressed) {
    //   yield SettingsStateEditDetailsSaving();
    //   UserModel userModel = await UserService.updateUser(event.context,
    //       updateUserParameters: event.updatedUserInfo);
    //   if (userModel != null) {
    //     await _userRepository.updateUser(userModel);
    //     yield SettingsStateEditDetailsSaveCompleted();
    //   } else {
    //     yield SettingsStateEditDetailsSaveFailed();
    //   }
    // }

    if (event is SettingsEventChangePasswordButtonPressed) {
      yield SettingsStateChangingPin();
      //
      // bool wasSuccessful = await IdentityService.changePassword(event.context,
      //     updatePinInfo: event.updatedPasswordInfo);
      // if (wasSuccessful) {
      //   yield SettingsStateChangingCompleted();
      // } else {
      //   yield SettingsStateChangingFailed();
      // }
    }
  }
}
