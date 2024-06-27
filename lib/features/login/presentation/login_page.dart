import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:f7apparel_mobile/common/middlewares/tdm_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:f7apparel_mobile/widgets/custom_text_form_field.dart';
import 'package:f7apparel_mobile/widgets/loader.dart';
import 'package:f7apparel_mobile/widgets/message_snackbar.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';
import 'package:f7apparel_mobile/widgets/helper.dart';
import 'package:f7apparel_mobile/blocs/authentication/authentication_bloc.dart';
import 'package:f7apparel_mobile/blocs/authentication/authentication_event.dart';
import 'package:f7apparel_mobile/blocs/login/login_bloc.dart';
import 'package:f7apparel_mobile/blocs/login/login_bloc_State.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:f7apparel_mobile/widgets/buttons.dart';

import '../../../blocs/login/login_bloc_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
        child: _LoginPageContent(),
      ),
    );
  }
}

class _LoginPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageContentState();
  }
}

class _LoginPageContentState extends State<_LoginPageContent> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String valueFromState = " ";
  bool isActive = true;
  bool isErrorTextVisible = false;
  bool? isRememberMe = false;
  bool isPasswordObscure = true;
  bool isLogged = false;
  bool checkStorage = false;
  String authorizedOrNot = "Not Authorized";
  String? password, emailAddress;
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    loadStorage();
    if (Platform.isIOS) {
      // FormKeyboardActions.setKeyboardActions(context, _keyboardActionsConfig(context));
    }

    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void loadStorage() async {
    HantspolStorage userRepository = HantspolStorage.getInstance();
    emailAddress = await userRepository.getEmail();
    password = await userRepository.getPassword();
    if (emailAddress != null && password != null) {
      {
        setState(() {
          _emailController.text = emailAddress!;
          checkStorage = true;
        });
      }
    }
  }



  void _onLoginButtonPressed() {
    FocusScope.of(context).unfocus();
    if (_loginFormKey.currentState!.validate()) {
      Map<String, dynamic> parameters = {
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim()
      };

      BlocProvider.of<LoginBloc>(context, listen: false).add(
        LoginEmailEventButtonPressed(context, parameters: parameters),
      );
    }

    // else {
    //   HantspolSnackBar.showErrorSnackBar(context,
    //       message: "An error occurred");
    // }

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<LoginBloc, LoginBlocState>(
        listener: (BuildContext context, state) {
          if (state is LoginStateLoading) {
            Loader.show(context);
          }

          if (state is LoginStateFailed) {
            Loader.dismiss(context);
            HantspolSnackBar.showErrorSnackBar(context, message: state.message!);
          }
          if (state is LoginStateSuccessful) {
            context.read<AuthenticationBloc>().add(AuthenticationEventSignedIn(
                context,
                accessToken: state.accessToken));
            // Loader.dismiss(context);
            // BlocProvider.of<AuthenticationBloc>(context, listen: false).add(AuthenticationEventSignedIn(context, accessToken: state.accessToken));
            // launchNewScreenWithNewTask(context, Routes.dashboardRoute);
            // return;
          }
        },
        child:


        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Form(
                  key: _loginFormKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: 130.h,
                      // horizontal: 16.w,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text('Hello!',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0Xff007BFF),
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp)),
                      ),
                      const VerticalSpace(size: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text('Login in to your account',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const VerticalSpace(size: 28),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('Email Address',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xdd3E4352),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Lato',
                                fontFamilyFallback: const <String>['OpenSans'],
                              )),
                        ),
                        subtitle: CustomTextFormField2(
                          controller: _emailController,
                          textInputAction: TextInputAction.done,
                          label: '',
                          hintText: 'johndoe@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.multipleAnd([
                            Validators.notEmpty(fieldName: "Email"),
                            // Validators.minLength(11),
                          ]),
                          // maxLength: 11,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      const VerticalSpace(size: 28),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('Password',
                              textAlign: TextAlign.start,
                              style:  TextStyle(
                                color: const Color(0xdd3E4352),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Lato',
                                fontFamilyFallback: const <String>['OpenSans'],
                              )),
                        ),
                        subtitle:CustomTextFormField2(
                          controller: _passwordController,
                          label: '',
                          hintText: '**********',
                          obscureText: isPasswordObscure,
                          keyboardType: TextInputType.visiblePassword,
                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
                          validator: Validators.multipleAnd([
                            Validators.notEmpty(fieldName: "Password"),
                            // Validators.minLength(6),
                            // Validators.password(6),
                          ]),
                          // maxLength: 4,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          suffixIcon: IconButton(
                            icon: Icon(isPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                "FORGOT YOUR PASSWORD ?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12.sp),
                              ),
                              onPressed: () {
                                // Navigator.of(context)
                                //     .pushNamed(Routes.forgotPasswordRoute);
                                // return;
                              },
                            ),
                            const SizedBox(),

                          ],
                        ),
                      ),
                      const VerticalSpace(size: 26),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: BigButton(
                                text: "Log in",
                                backgroundColor: theme.primaryColor,
                                textColor: Colors.white,
                                onPressed: _onLoginButtonPressed,
                                borderRadius: 6.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpace(size: 36),
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Don’t have an account?  ",
                                  style: Theme.of(context).textTheme.headlineSmall),
                              TextSpan(
                                text: "Create an account",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Lato',
                                    fontSize: 16.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.signupInvitationPageRoute);

                                    return;
                                  },
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

}
