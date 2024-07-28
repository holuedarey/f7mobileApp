
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

import 'resetpassword.dart';

class VerifyPasswordOTPScreen extends StatelessWidget {
  final String? email;
  const VerifyPasswordOTPScreen({Key? key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordBloc>(
        create: (BuildContext context) => ForgetPasswordBloc(),
        child:  VerifyPasswordOTPPage(email:email));
  }
}

class VerifyPasswordOTPPage extends StatefulWidget {
  final String? email;
  const VerifyPasswordOTPPage({Key? key, this.email}) : super(key: key);

  @override
  State<VerifyPasswordOTPPage> createState() => _VerifyPasswordOTPPageState();
}

class _VerifyPasswordOTPPageState extends State<VerifyPasswordOTPPage> {
  final TextEditingController phoneController = TextEditingController();
  bool isErrorTextVisible = false;
  bool? isRememberMe = false;
  bool isPasswordObscure = true;
  final _verifyPasswordOTPPage = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  bool isConfirmPasswordObscure = true;


  void _onVerifyPasswordOTPPageButtonPressed() {
    FocusScope.of(context).unfocus();
    if (_verifyPasswordOTPPage.currentState!.validate()) {
      Map<String, dynamic> parameters = {
        'email': widget.email,
        'otp': _otpController.text,
      };

      context.read<ForgetPasswordBloc>().add(
        VerifyOTPPasswordEvent(parameters: parameters),
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
          if (state is VerifyOTPPasswordStateSuccessful) {
            Loader.dismiss(context);
            Navigator.pushNamed(context, Routes.resetPasswordRoute,
                arguments: ResetPasswordArgument(email: widget.email));
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(size: 68),
                  Text('Email Sent',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1),
                  const VerticalSpace(size: 8),
                  Text(
                      'A 4 digit code has been sent to your email.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14.sp)),
                  const VerticalSpace(size: 34),
                  Form(
                    key: _verifyPasswordOTPPage,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpace(size: 54),
                        Text('Enter OTP',
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
                        VerticalSpace(size: 5,),
                        CustomTextFormField2(
                          controller: _otpController,
                          labelText: '',
                          label: '',
                          hintText: '....',
                          obscureText: isPasswordObscure,
                          keyboardType: TextInputType.visiblePassword,
                          validator: Validators.multipleAnd([
                            Validators.notEmpty(fieldName: "OTP"),
                            Validators.minLength(4),
                          ]),
                          inputFormatters: [LengthLimitingTextInputFormatter(6)],
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
                        const VerticalSpace(size: 94),
                        BigButton(
                          elevation: 4.0,
                          text: "SUBMIT",
                          backgroundColor: theme.primaryColor,
                          textColor: Colors.white,
                          onPressed: _onVerifyPasswordOTPPageButtonPressed,
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

class VerifyPasswordOTPArgument {
  final String? email;
  VerifyPasswordOTPArgument({this.email});
}
