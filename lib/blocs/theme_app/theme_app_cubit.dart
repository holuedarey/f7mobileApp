import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/middlewares/storage_helper.dart';
part 'theme_app_state.dart';

class ThemeAppCubit extends Cubit<ThemeAppState> {
  static const kBrightnessSetting = 'BRIGHTNESS_SETTING';

  ThemeAppCubit():super(ThemeAppStateInitial());

  void setUserTheme({required bool light}) async {
     StorageHelper.setBoolean(kBrightnessSetting, light);
    if (light) {
      emit(ThemeAppStateLight());
    } else {
      emit(ThemeAppStateDark());
    }
  }



  void getCurrentTheme() async{
    final res  =  await StorageHelper.getBoolean(kBrightnessSetting, true);
    if (res != null) {
      if (res) {
        emit(ThemeAppStateLight());
      } else {
        emit(ThemeAppStateDark());
      }
    } else {
      emit(ThemeAppStateSystem());
    }
  }

  Future<int> getCurrentThemeValue() async{

    final res  =  await StorageHelper.getBoolean(kBrightnessSetting, true);
    if (res != null) {
      if (res) {
        return 0;
      } else {
        return 1;
      }
    } else {
      return 2;
    }
  }

  void setSystemTheme() async {
      StorageHelper.remove(kBrightnessSetting);
    emit(ThemeAppStateSystem());
  }
}
