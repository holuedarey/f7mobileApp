import 'dart:developer';

import 'package:f7apparel_mobile/features/cart/cart.dart';
import 'package:f7apparel_mobile/features/change_password/presentation/pages/changepassword.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/pages/bottom_navbar_manager.dart';
import 'package:f7apparel_mobile/features/forgot_password/presentation/pages/forgotpassword.dart';
import 'package:f7apparel_mobile/features/forgot_password/presentation/pages/resetpassword.dart';
import 'package:f7apparel_mobile/features/forgot_password/presentation/pages/verifypasswordotp.dart';
import 'package:f7apparel_mobile/features/homepage/presentation/home_page.dart';
import 'package:f7apparel_mobile/features/onboarding/onboarding_screen.dart';
import 'package:f7apparel_mobile/features/product_details/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f7apparel_mobile/features/login/presentation/login_page.dart';
import 'blocs/authentication/authentication_bloc.dart';
import 'blocs/authentication/authentication_event.dart';
import 'blocs/authentication/authentication_state.dart';
import 'common/middlewares/token_repository.dart';
import 'common/system_util.dart';
import 'features/sign_up/presentation/pages/confirm_access_pin_widget.dart';
import 'features/sign_up/presentation/pages/create_account_profile_page.dart';
import 'features/sign_up/presentation/pages/sign_up_email_password_page.dart';
import 'features/landing_page.dart';
import 'myapp.dart';
import 'features/splash_page.dart';

class AttachmentPage extends StatefulWidget {
  static final GlobalKey<NavigatorState> attachmentNavKey =
  GlobalKey<NavigatorState>();

  const AttachmentPage({Key? key}) : super(key: key);

  @override
  AttachmentPageState createState() => AttachmentPageState();
}

class AttachmentPageState extends State<AttachmentPage>
    with WidgetsBindingObserver {
  final tokenRepository = TokenRepository.getInstance();

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(
              title!,
              textAlign: TextAlign.center,
            ),
            content: Text(
              body!,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              CupertinoButton.filled(
                  child: const Text('CLOSE'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // initializeFlutterFire();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    AuthenticationBloc bloc =
    BlocProvider.of<AuthenticationBloc>(context, listen: false);
    if (state == AppLifecycleState.paused) {
      bloc.add(AuthenticationEventAppInactive());
    } else if (state == AppLifecycleState.resumed) {
      bloc.add(AuthenticationEventAppResumed());
    }
    super.didChangeAppLifecycleState(state);
  }

  void _showTimeOutDialog(BuildContext context) async {
    AuthenticationBloc bloc =
    BlocProvider.of<AuthenticationBloc>(context, listen: false);

    var hasClosed = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Session Expired'),
            content: const Text('Please login again.'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });

    if (hasClosed == null || hasClosed != null) {
      bool shouldLogOut = bloc.isSignedIn;
      if (shouldLogOut) {
        bloc.add(AuthenticationEventSignedOut());
      }
    }
  }

  showToken() async {
    if (!kDebugMode) return;
    final token =
    await TokenRepository.getInstance().getToken(TokenType.ACCESS);
    log(token ?? "NO TOKEN");
  }

  @override
  Widget build(BuildContext context) {
    showToken();
    SizeConfig().init(context);
    return BlocListener<AuthenticationBloc, AuthenticationBlocState>(
      listener: (BuildContext context, AuthenticationBlocState state) {
        if (state is AuthenticationStateTimeOut) {
          _showTimeOutDialog(context);
        }
        // else if (state is AuthenticationStateForceUpdate) {
        //   AttachmentPage.attachmentNavKey.currentState!.pushNamedAndRemoveUntil('attachment/forceupdate', (_) => false);
        // }
        // else if (state is AuthenticationStateShowOnBoarding) {
        //   AttachmentPage.attachmentNavKey.currentState!.pushNamedAndRemoveUntil('attachment/onboardView', (_) => false);
        // }
        else if (state is AuthenticationStateAuthenticated) {
          AttachmentPage.attachmentNavKey.currentState!
              .pushNamedAndRemoveUntil(Routes.dashboardRoute, (_) => false);
        }
        // else if (state is AuthenticationStateReAuthenticate) {
        //   AttachmentPage.attachmentNavKey.currentState!.pushNamedAndRemoveUntil('attachment/signupPage', (_) => false);
        // }
        else if (state is AuthenticationStateUnAuthenticated) {
          // AttachmentPage.attachmentNavKey.currentState!
          //     .pushNamedAndRemoveUntil(Routes.dashboardRoute, (_) => false);

          AttachmentPage.attachmentNavKey.currentState!
              .pushNamedAndRemoveUntil(Routes.onboardingPageRoute, (_) => false);
        }
        // else if (state is AuthenticationStateLoading) {
        //   LoadingPageArgument args = LoadingPageArgument(
        //     accessToken: state.accessToken,
        //     type: state.type,
        //   );
        //   AttachmentPage.attachmentNavKey.currentState!.pushNamedAndRemoveUntil('attachment/loading', (_) => false, arguments: args);
        // }
      },
      child: WillPopScope(
        onWillPop: () async {
          return !await AttachmentPage.attachmentNavKey.currentState!
              .maybePop();
        },
        child: Navigator(
          key: AttachmentPage.attachmentNavKey,
          // initialRoute: 'attachment/dashboard',
          initialRoute: 'attachment',
          onGenerateRoute: _onGenerateRoute,
          // observers: [observer],
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget builder = Container();
    bool fullscreenDialog = false;

    switch (settings.name) {
      case Routes.attachment:
        builder = _Content();
        break;
      case Routes.landingPageRoute:
        builder = const LandingPage();
        fullscreenDialog = true;
        break;

      case Routes.loginPageRoute:
        builder = const LoginPage();
        fullscreenDialog = true;
        break;
      case Routes.signUpEmailPasswordRoute:
        // VerifyInvitationArgument args =
        // settings.arguments as VerifyInvitationArgument;
        builder = const SignUpEmailPasswordScreen();
        break;
      case Routes.onboardingPageRoute:
        builder = const OnboardingScreen();
        fullscreenDialog = true;
        break;
      case Routes.forgotPasswordRoute:
        builder = const ForgotPasswordScreen();
        fullscreenDialog = true;
        break;

      case Routes.resetPasswordRoute:
        ResetPasswordArgument args =
        settings.arguments as ResetPasswordArgument;
        builder = ResetPasswordScreen(
          email: args.email,
        );
        break;

      case Routes.verifyPasswordOTPRoute:
        VerifyPasswordOTPArgument args =
        settings.arguments as VerifyPasswordOTPArgument;
        builder = VerifyPasswordOTPScreen(
          email: args.email,
        );
        break;

      case Routes.changePasswordRoute:
        builder = const ChangePasswordScreen();
        fullscreenDialog = true;
        break;

      case Routes.createAccountRoute:
        CreateAccountProfileArgument args =
        settings.arguments as CreateAccountProfileArgument;
        builder = CreateAccountProfileScreen(
          invitationResponse: args.invitationResponse,
          registerUserResponse: args.registerUserResponse,
          email: args.email,
          password: args.password,
        );
        break;


      case Routes.confirmAccessPinRoute:
        ConfirmAccessPinArgument args =
        settings.arguments as ConfirmAccessPinArgument;
        builder = ConfirmAccessPinScreen(
          registerUserResponse: args.registerUserResponse,
          email: args.email,
          password: args.password,
        );
        break;

      case Routes.productDetailsScreen:
        fullscreenDialog = true;
        ProductDetailsArgument args =
        settings.arguments as ProductDetailsArgument;
        builder = ProductDetails(product: args.product);
        break;

      case Routes.dashboardRoute:
        builder = const BottomNavbarIndexPage();
        fullscreenDialog = false;
        break;

      case Routes.cart:
        builder = const CartPage();
        break;
      default:
        throw Exception('Attachment: Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: (_) => builder,
      fullscreenDialog: fullscreenDialog,
      settings: settings,
    );
  }
}

class _Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
