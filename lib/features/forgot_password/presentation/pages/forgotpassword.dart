import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:f7apparel_mobile/blocs/forget_password/forget_password_bloc.dart';
import 'package:f7apparel_mobile/blocs/forget_password/forget_password_bloc_State.dart';
import 'package:f7apparel_mobile/blocs/forget_password/forget_password_bloc_event.dart';
import 'package:f7apparel_mobile/blocs/result_handler/result_handler_bloc.dart';
import 'package:f7apparel_mobile/blocs/result_handler/result_handler_event.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:f7apparel_mobile/widgets/buttons.dart';
import 'package:f7apparel_mobile/widgets/custom_text_form_field.dart';
import 'package:f7apparel_mobile/widgets/helper.dart';
import 'package:f7apparel_mobile/widgets/loader.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';

import 'verifypasswordotp.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordBloc>(
        create: (BuildContext context) => ForgetPasswordBloc(),
        child: const ForgotPasswordPage());
  }
}

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isErrorTextVisible = false;
  bool? isRememberMe = false;
  bool isPasswordObscure = true;
  final forgotPasswordPageFormKey = GlobalKey<FormState>();

  void _onForgotPasswordPageButtonPressed() {
    FocusScope.of(context).unfocus();
    if (forgotPasswordPageFormKey.currentState!.validate()) {
      context.read<ForgetPasswordBloc>().add(
            ForgetPasswordEventButtonPressed(
                emailAddress: emailController.text.trim()),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<ForgetPasswordBloc, ForgetPasswordBlocState>(
        listener: (BuildContext context, state) {
      if (state is ForgetPasswordStateLoading) {
        Loader.show(context);
      }
      if (state is ForgetPasswordStateSuccessful) {
        Loader.dismiss(context);
        Navigator.pushNamed(context, Routes.verifyPasswordOTPRoute,
            arguments:
                VerifyPasswordOTPArgument(email: emailController.text.trim()));
        return;
      }
      if (state is ForgetPasswordStateFailed) {
        Loader.dismiss(context);
        BlocProvider.of<ResultHandlerBloc>(context, listen: false)
            .add(ResultHandlerEventShowError(message: state.message));
      }
    }, child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordBlocState>(
            builder: (BuildContext context, ForgetPasswordBlocState state) {
      return Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 18.0.w, right: 18.0.w, top: 85.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalSpace(size: 68),
              Text('Forget your password?',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline1),
              const VerticalSpace(size: 8),
              Text(
                  'Enter your email address and we’ll send you a link to reset your password',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14.sp)),
              const VerticalSpace(size: 10),
              Form(
                key: forgotPasswordPageFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpace(size: 40),
                    Text('Email Address',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color(0xdd3E4352),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'WokSans',
                          fontFamilyFallback: const <String>['OpenSans'],
                        )
                    ),
                    const VerticalSpace(size: 10),
                    CustomTextFormField2(
                      controller: emailController,
                      textInputAction: TextInputAction.done,
                      labelText: '',
                      label: '',
                      hintText: '',
                      keyboardType: TextInputType.emailAddress,
                      // inputFormatters: [
                      // FilteringTextInputFormatter.digitsOnly,
                      // LengthLimitingTextInputFormatter(11)
                      // ],
                      validator: Validators.multipleAnd([
                        Validators.notEmpty(fieldName: "Email Address"),
                        Validators.email(),
                      ]),
                      // maxLength: 11,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const VerticalSpace(size: 94),
                    BigButton(
                      elevation: 4.0,
                      text: "SUBMIT",
                      backgroundColor: theme.primaryColor,
                      textColor: Colors.white,
                      onPressed: _onForgotPasswordPageButtonPressed,
                      borderRadius: 30.0,
                    )
                  ],
                ),
              ),
              const VerticalSpace(size: 34),
            ],
          ),
        ),
      );
    }));
  }
}
