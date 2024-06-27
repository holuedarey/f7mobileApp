import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class SettingsBlocEvent extends Equatable {
  // SettingsBlocEvent([List props = const []]) : super([props]);

  @override
  List<Object> get props => [];
}

class SettingsEventInitialised extends SettingsBlocEvent {}

class SettingsEventReload extends SettingsBlocEvent {}

class SettingsEventEditDetailsSaveButtonPressed extends SettingsBlocEvent {
  final BuildContext context;
  final Map<String, dynamic>? updatedUserInfo;

  SettingsEventEditDetailsSaveButtonPressed(this.context, {this.updatedUserInfo});
}

class SettingsEventChangePasswordButtonPressed extends SettingsBlocEvent {
  final BuildContext context;
  final Map<String, dynamic>? updatedPasswordInfo;

  SettingsEventChangePasswordButtonPressed(this.context, {this.updatedPasswordInfo});
}

class SettingsEventPreferenceActionButtonPressed extends SettingsBlocEvent {}
