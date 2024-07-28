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
import 'package:f7apparel_mobile/widgets/loader.dart';
import 'package:f7apparel_mobile/widgets/message_snackbar.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String? email;
  const ResetPasswordScreen({Key? key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordBloc>(
        create: (BuildContext context) => ForgetPasswordBloc(),
        child: ResetPasswordPage(email: email));
  }
}

class ResetPasswordPage extends StatefulWidget {
  final String? email;
  const ResetPasswordPage({Key? key, this.email}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isErrorTextVisible = false;
  bool? isRememberMe = false;
  bool isPasswordObscure = true;
  final _resetPasswordPageFormKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordSixCharacters = false;
  bool _isSpecialCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _isUpperAndLowerCaseCharacters = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'\d');

    setState(() {
      _isPasswordSixCharacters = false;
      if(password.length >= 8) {
        _isPasswordSixCharacters = true;
      }
      _isSpecialCharacters = false;
      if(password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        _isSpecialCharacters = true;
      }
      _isUpperAndLowerCaseCharacters = false;
      if(password.contains(RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+"))) {
        _isUpperAndLowerCaseCharacters = true;
      }

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
    });
  }
  void _onResetPasswordPageButtonPressed() {
    FocusScope.of(context).unfocus();
    if (_resetPasswordPageFormKey.currentState!.validate()) {
      Map<String, dynamic> parameters = {
        'email': widget.email,
        'newPassword': passwordController.text,
      };

      context.read<ForgetPasswordBloc>().add(
        ResetPasswordEvent(parameters: parameters),
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
          if (state is ChangePasswordStateSuccessful) {
            // Loader.dismiss(context);
            HantspolSnackBar.showSuccessSnackBar(context, message: 'Password reset successfully');

             Future.delayed(const Duration(milliseconds: 1200));
            Navigator.of(context).popUntil(ModalRoute.withName(Routes.loginPageRoute));
          }
          if (state is ForgetPasswordStateFailed) {
            Loader.dismiss(context);
            BlocProvider.of<ResultHandlerBloc>(context, listen: false)
                .add(ResultHandlerEventShowError(message: state.message));
          }
        }, child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordBlocState>(
        builder: (BuildContext context, ForgetPasswordBlocState state) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(left: 18.0.w, right: 18.0.w, top: 85.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(size: 68),
                  Text('Create new password',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1),
                  const VerticalSpace(size: 8),
                  Text(
                      'Enter Password',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14.sp)),
                  const VerticalSpace(size: 14),
                  Form(
                    key: _resetPasswordPageFormKey,
                    child: Column(
                      children: [
                        const VerticalSpace(size: 54),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (password) => onPasswordChanged(password),
                          obscureText: !isPasswordObscure,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password form is empty';
                            }
                            if (!_hasPasswordOneNumber ||!_isUpperAndLowerCaseCharacters || !_isSpecialCharacters || !_isPasswordSixCharacters) {
                              return 'Password is weak';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '....',
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
                            labelStyle: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontSize: 14.sp, fontWeight: FontWeight.w400),
                            hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 14.sp, fontWeight: FontWeight.w400),
                            fillColor: Theme.of(context).colorScheme.background,
                            filled: true,
                            isDense: true,
                            alignLabelWithHint: true,
                            contentPadding:EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.inverseSurface,
                                width: 0.6,
                                style: BorderStyle.solid,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.inverseSurface,
                                width: 0.6,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.inverseSurface,
                                width: 0.6,
                                style: BorderStyle.solid,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                                width: 0.6,
                                style: BorderStyle.solid,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          style: TextStyle(
                            color: const Color(0xdd000000),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Poppins',
                            fontFamilyFallback: const <String>['Poppins'],
                          ),
                        ),
                        const VerticalSpace(size: 14),

                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: _isPasswordSixCharacters ?  Theme.of(context).primaryColor : Colors.transparent,
                                  border: _isPasswordSixCharacters ? Border.all(color: Colors.transparent) :
                                  Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                            ),
                            const SizedBox(width: 10,),
                             Text("Contains at least 6 characters",style:Theme.of(context).textTheme.subtitle2)
                          ],
                        ),
                        const VerticalSpace(size: 10),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: _hasPasswordOneNumber ?  Theme.of(context).primaryColor : Colors.transparent,
                                  border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                                  Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                            ),
                            const SizedBox(width: 10,),
                             Text("Contains at least 1 number",style:Theme.of(context).textTheme.subtitle2)
                          ],
                        ),
                        const VerticalSpace(size: 10),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: _isSpecialCharacters ? Theme.of(context).primaryColor : Colors.transparent,
                                  border: _isSpecialCharacters ? Border.all(color: Colors.transparent) :
                                  Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                            ),
                            const SizedBox(width: 10,),
                             Text("Contains special characters",style:Theme.of(context).textTheme.subtitle2)
                          ],
                        ),
                        const VerticalSpace(size: 10),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: _isUpperAndLowerCaseCharacters ? Theme.of(context).primaryColor : Colors.transparent,
                                  border: _isUpperAndLowerCaseCharacters ? Border.all(color: Colors.transparent) :
                                  Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                            ),
                            const SizedBox(width: 10,),
                            Text("Contains both Upper & Lower cases",style:Theme.of(context).textTheme.subtitle2)
                          ],
                        ),
                        const VerticalSpace(size: 14),

                        const VerticalSpace(size: 34),
                        BigButton(
                          elevation: 4.0,
                          text: "SUBMIT",
                          backgroundColor: theme.primaryColor,
                          textColor: Colors.white,
                          onPressed: _onResetPasswordPageButtonPressed,
                          borderRadius: 30.0,
                        )
                      ],
                    ),
                  ),
                  const VerticalSpace(size: 14),

                ],
              ),
            ),
          );
        }));
  }
}

class ResetPasswordArgument {
  final String? email;
  ResetPasswordArgument({this.email});
}
