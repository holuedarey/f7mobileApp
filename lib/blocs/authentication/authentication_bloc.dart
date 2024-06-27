import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/secret/secret_model.dart';
import '../../common/middlewares/tdm_storage.dart';
import '../../common/middlewares/token_repository.dart';

import '../blocs.dart';

const SESSION_TIMEOUT_SECONDS = 299;
const DISPLAY_TIMEOUT_DIALOG_AFTER_SECONDS = 301;

class AuthenticationBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  final HantspolStorage _hantspolStorage = HantspolStorage.getInstance();

  final tokenRepository = TokenRepository.getInstance();
  Timer? _inActivityTimer;
  Timer? _timeoutTimer;
  bool isSignedIn = false;

  final BuildContext context;

  AuthenticationBloc(this.context) : super(AuthenticationStateUninitialised());

  @override
  Stream<AuthenticationBlocState> mapEventToState(
      AuthenticationBlocEvent event) async* {
    if (event is AuthenticationEventAppInactive) {
     // await tokenRepository.deleteToken();
      if (_inActivityTimer == null && isSignedIn) {
        _inActivityTimer = Timer(
          const Duration(seconds: SESSION_TIMEOUT_SECONDS),
          () {
            _inActivityTimer!.cancel();
            _inActivityTimer = null;
            add(AuthenticationEventSignedOut());
          },
        );

        _timeoutTimer =
            Timer(const Duration(seconds: DISPLAY_TIMEOUT_DIALOG_AFTER_SECONDS), () {
          _timeoutTimer!.cancel();
          _timeoutTimer = null;
          add(AuthenticationEventTimeOut());
        });
      }
    } else if (event is AuthenticationEventTimeOut) {
      await tokenRepository.deleteToken();
      yield AuthenticationStateTimeOut();
    } else if (event is AuthenticationEventForceUpdate) {
      yield AuthenticationStateForceUpdate();
    } else if (event is AuthenticationEventAppResumed) {
      if (_inActivityTimer != null) {
        _inActivityTimer!.cancel();
        _timeoutTimer!.cancel();
        _inActivityTimer = null;
        _timeoutTimer = null;
      }
    }

    else if (event is AuthenticationEventAppStated) {
      // await tokenRepository.deleteToken();
      // bool hasToken = await tokenRepository.hasToken(TokenType.ACCESS);
      await Future.delayed(const Duration(milliseconds: 4500));
      isSignedIn = false;
      yield AuthenticationStateUnAuthenticated();
    }

    else if (event is AuthenticationEventSignedIn) {
      // yield AuthenticationStateLoading(accessToken: event.accessToken, type: LoadingStateType.Entry);
      try {

        UserDataResponse? userDataResponse  = await _hantspolStorage.getUserData();
        if (userDataResponse != null) {
          await tokenRepository.persistToken({TokenType.ACCESS: userDataResponse.accessToken});
          isSignedIn = true;
          yield AuthenticationStateAuthenticated();
          Timer(const Duration(seconds: 3500), () {
          // add(AuthenticationEventSignedOut());
          });
        }
      } on Exception {
        yield AuthenticationStateUnAuthenticated();
      }
    } else if (event is AuthenticationEventSignedOut) {
      isSignedIn = false;
      // yield AuthenticationStateLoading(type: LoadingStateType.Exit);
      await tokenRepository.deleteToken();
      await _hantspolStorage.deleteAllUser();
      // await Future.delayed(const Duration(milliseconds: 3000));
      yield AuthenticationStateUnAuthenticated();
    }
  }
}
