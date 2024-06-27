import 'package:equatable/equatable.dart';
import '../../models/secret/secret_model.dart';

class SettingsBlocState extends Equatable {
  // SettingsBlocState([List props = const []]) : super([props]);

  @override
  List<Object> get props => [];
}

class SettingsStateInitialised extends SettingsBlocState {}

class SettingsStateLoading extends SettingsBlocState {}

class SettingsStateCompleted extends SettingsBlocState {
  final EmployeeData user;

  SettingsStateCompleted({required this.user});
}

class SettingsStateFailed extends SettingsBlocState {}

class SettingsStateEditDetails extends SettingsBlocState {
  final EmployeeData user;

  SettingsStateEditDetails({required this.user});
}

class SettingsStateEditDetailsSaving extends SettingsBlocState {}

class SettingsStateEditDetailsSaveCompleted extends SettingsBlocState {}

class SettingsStateEditDetailsSaveFailed extends SettingsBlocState {
  final String? message;

  SettingsStateEditDetailsSaveFailed({this.message});
}

class SettingsStateChangingPin extends SettingsBlocState {}

class SettingsStateChangingCompleted extends SettingsBlocState {}

class SettingsStateChangingFailed extends SettingsBlocState {
  final String? message;

  SettingsStateChangingFailed({this.message});
}
