// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hantspol/blocs/registration/sign_up_cubit.dart';
// import 'package:hantspol/myapp.dart';
// import 'package:hantspol/widgets/back_button.dart';
// import 'package:hantspol/widgets/buttons.dart';
// import 'package:hantspol/widgets/custom_text_form_field.dart';
// import 'package:hantspol/widgets/helper.dart';
// import 'package:hantspol/widgets/loader.dart';
// import '../../../../blocs/result_handler/result_handler_bloc.dart';
// import '../../../../blocs/result_handler/result_handler_event.dart';
// import '../../../../common/system_util.dart';
// import '../../../../models/registration/user_otp_response.dart';
// import '../../../../widgets/spacing.dart';
// import 'create_account_profile_page.dart';
//
//
// class SignUpEmailPasswordScreen extends StatelessWidget {
//   final InvitationResponse? invitationResponse;
//   const SignUpEmailPasswordScreen({Key? key, this.invitationResponse}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider<SignUpCubit>(
//             create: (BuildContext context) => SignUpCubit(),
//           )
//         ],
//         child:
//         SignUpEmailPasswordPage(invitationResponse: invitationResponse));
//   }
// }
//
//
//
// class SignUpEmailPasswordPage extends StatefulWidget {
//   final InvitationResponse? invitationResponse;
//   const SignUpEmailPasswordPage({Key? key, this.invitationResponse}) : super(key: key);
//
//   @override
//   State<SignUpEmailPasswordPage> createState() =>
//       _SignUpEmailPasswordPageState();
// }
//
// class _SignUpEmailPasswordPageState extends State<SignUpEmailPasswordPage> {
//   final signUpEmailPasswordFormKey = GlobalKey<FormState>();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isErrorTextVisible = false;
//   bool? isRememberMe = false;
//   bool isPasswordObscure = true;
//   bool isConfirmPasswordObscure = true;
//
//   bool _isPasswordSixCharacters = false;
//   bool _isSpecialCharacters = false;
//   bool _hasPasswordOneNumber = false;
//   bool _isUpperAndLowerCaseCharacters = false;
//
//   onPasswordChanged(String password) {
//     final numericRegex = RegExp(r'\d');
//
//     setState(() {
//       _isPasswordSixCharacters = false;
//       if (password.length >= 8) {
//         _isPasswordSixCharacters = true;
//       }
//       _isSpecialCharacters = false;
//       if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
//         _isSpecialCharacters = true;
//       }
//       _isUpperAndLowerCaseCharacters = false;
//       if (password.contains(RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+"))) {
//         _isUpperAndLowerCaseCharacters = true;
//       }
//
//       _hasPasswordOneNumber = false;
//       if (numericRegex.hasMatch(password)) {
//         _hasPasswordOneNumber = true;
//       }
//     });
//   }
//
//   void _onSignUpEmailPasswordButtonPressed() {
//     FocusScope.of(context).unfocus();
//     if (signUpEmailPasswordFormKey.currentState!.validate()) {
//       Map<String, dynamic> parameters = {
//         'email': _emailController.text.trim(),
//         'password': passwordController.text.trim(),
//         'invite_code': widget.invitationResponse?.inviteCode,
//       };
//       context.read<SignUpCubit>().registerUser(parameters, widget.invitationResponse!.organizationId!);
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<SignUpCubit, SignUpState>(listener: (context, state) {
//           if (state is SignUpLoadingState) {
//             Loader.show(context);
//           }
//           if (state is SignUpSuccessState) {
//             Loader.dismiss(context);
//             Navigator.pushNamed(context, Routes.createAccountRoute,
//                 arguments: CreateAccountProfileArgument(
//                     registerUserResponse: state.registerUserResponse,
//                     invitationResponse:widget.invitationResponse,
//                     email:_emailController.text.trim(),
//                     password: passwordController.text.trim()
//                 ));
//
//           }
//           if (state is SignUpErrorState) {
//             Loader.dismiss(context);
//             BlocProvider.of<ResultHandlerBloc>(context, listen: false).add(ResultHandlerEventShowError(message: state.message));
//           }
//         }),
//       ],
//       child: BlocBuilder<SignUpCubit, SignUpState>(
//         builder: (BuildContext context, SignUpState state) {
//           return
//
//             Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.background,
//             appBar: AppBar(
//               leadingWidth: 80,
//               leading: CustomBackButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(Routes.loginPageRoute);
//                 },
//               ),
//               title: Text('Register an Account',
//                   textAlign: TextAlign.start,
//                   style: Theme.of(context).textTheme.displayLarge),
//             ),
//             body: SingleChildScrollView(
//               padding: EdgeInsets.only(right: 4.0.w, top: 36.h),
//               child: Form(
//                 key: signUpEmailPasswordFormKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                       child: Text('Begin your journey!',
//                           textAlign: TextAlign.start,
//                           style: Theme.of(context).textTheme.titleLarge),
//                     ),
//                     const VerticalSpace(size: 24),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Email Address',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle: CustomTextFormField2(
//                         controller: _emailController,
//                         textInputAction: TextInputAction.done,
//                         label: '',
//                         hintText: 'johndoe@gmail.com',
//                         keyboardType: TextInputType.name,
//                         validator: Validators.multipleAnd([
//                           Validators.notEmpty(fieldName: "Email"),
//                           // Validators.minLength(3),
//                         ]),
//                         // maxLength: 11,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     const VerticalSpace(size: 14),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('New Password',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle: CustomTextFormField2(
//                         controller: passwordController,
//                         labelText: '',
//                         label: '',
//                         hintText: '***************',
//                         obscureText: isPasswordObscure,
//                         keyboardType: TextInputType.visiblePassword,
//                         validator: Validators.multipleAnd([
//                           // Validators.notEmpty(fieldName: "Password"),
//                           Validators.minLength(6),
//                         ]),
//                         // maxLength: 4,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         suffixIcon: IconButton(
//                           icon: Icon(isPasswordObscure
//                               ? Icons.visibility_off
//                               : Icons.visibility),
//                           onPressed: () {
//                             setState(() {
//                               isPasswordObscure = !isPasswordObscure;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     const VerticalSpace(size: 14),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Confirm New Password',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle: TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         onChanged: (password) => onPasswordChanged(password),
//                         obscureText: isConfirmPasswordObscure,
//                         controller: confirmPasswordController,
//                         keyboardType: TextInputType.visiblePassword,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'New Password form is empty';
//                           }
//                           if (value != passwordController.text) {
//                             return 'Does not match new password ';
//                           }
//                           if (!_hasPasswordOneNumber ||
//                               !_isUpperAndLowerCaseCharacters ||
//                               !_isSpecialCharacters ||
//                               !_isPasswordSixCharacters) {
//                             return 'Password is weak';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           labelText: '',
//                           hintText: '***************',
//                           suffixIcon: IconButton(
//                             icon: Icon(isConfirmPasswordObscure
//                                 ? Icons.visibility_off
//                                 : Icons.visibility),
//                             onPressed: () {
//                               setState(() {
//                                 isConfirmPasswordObscure =
//                                 !isConfirmPasswordObscure;
//                               });
//                             },
//                           ),
//                           labelStyle: TextStyle(
//                               color: Theme.of(context).colorScheme.inverseSurface,
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w400),
//                           hintStyle: TextStyle(
//                               color:
//                               Theme.of(context).colorScheme.onSurfaceVariant,
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w400),
//                           fillColor: Theme.of(context).colorScheme.background,
//                           filled: true,
//                           isDense: true,
//                           alignLabelWithHint: true,
//                           contentPadding:
//                           EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide:  BorderSide(
//                               color: Theme.of(context).colorScheme.inverseSurface,
//                               width: 1.4,
//                               style: BorderStyle.solid,
//                             ),
//                           ),
//
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.inverseSurface,
//                               width: 0.6,
//                               style: BorderStyle.solid,
//                             ),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.inverseSurface,
//                               width: 0.6,
//                               style: BorderStyle.solid,
//                             ),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.inverseSurface,
//                               width: 0.6,
//                               style: BorderStyle.solid,
//                             ),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.error,
//                               width: 0.6,
//                               style: BorderStyle.solid,
//                             ),
//                           ),
//                           floatingLabelBehavior: FloatingLabelBehavior.always,
//                         ),
//                         style: TextStyle(
//                           color: const Color(0xdd000000),
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500,
//                           fontStyle: FontStyle.normal,
//                           fontFamily: 'Lato',
//                           fontFamilyFallback: const <String>['OpenSans'],
//                         ),
//                       ),
//                     ),
//                     const VerticalSpace(size: 26),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         children: [
//                           AnimatedContainer(
//                             duration: const Duration(milliseconds: 500),
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 color: _isPasswordSixCharacters
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                                 border: _isPasswordSixCharacters
//                                     ? Border.all(color: Colors.transparent)
//                                     : Border.all(color: Colors.grey.shade400),
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text("Contains at least 6 characters",
//                               style: Theme.of(context).textTheme.titleMedium)
//                         ],
//                       ),
//                     ),
//                     const VerticalSpace(size: 8),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         children: [
//                           AnimatedContainer(
//                             duration: const Duration(milliseconds: 500),
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 color: _hasPasswordOneNumber
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                                 border: _hasPasswordOneNumber
//                                     ? Border.all(color: Colors.transparent)
//                                     : Border.all(color: Colors.grey.shade400),
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text("Contains at least 1 number",
//                               style: Theme.of(context).textTheme.titleMedium)
//                         ],
//                       ),
//                     ),
//                     const VerticalSpace(size: 8),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         children: [
//                           AnimatedContainer(
//                             duration: const Duration(milliseconds: 500),
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 color: _isSpecialCharacters
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                                 border: _isSpecialCharacters
//                                     ? Border.all(color: Colors.transparent)
//                                     : Border.all(color: Colors.grey.shade400),
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text("Contains special characters",
//                               style: Theme.of(context).textTheme.titleMedium)
//                         ],
//                       ),
//                     ),
//                     const VerticalSpace(size: 8),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         children: [
//                           AnimatedContainer(
//                             duration: const Duration(milliseconds: 500),
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 color: _isUpperAndLowerCaseCharacters
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                                 border: _isUpperAndLowerCaseCharacters
//                                     ? Border.all(color: Colors.transparent)
//                                     : Border.all(color: Colors.grey.shade400),
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text("Contains both Upper & Lower cases",
//                               style: Theme.of(context).textTheme.titleMedium)
//                         ],
//                       ),
//                     ),
//                     const VerticalSpace(size: 18),
//
//                     VerticalSpace(size: MediaQuery.of(context).size.height * 0.05),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding:
//                             const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: BigButton(
//                               text: "Create Account",
//                               backgroundColor: const Color(0xFF007BFF),
//                               textColor: Colors.white,
//                               onPressed: _onSignUpEmailPasswordButtonPressed,
//                               borderRadius: 6.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const VerticalSpace(size: 36),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(
//                                 text: "You have an account? ",
//                                 style:
//                                 Theme
//                                     .of(context)
//                                     .textTheme
//                                     .headlineSmall),
//                             TextSpan(
//                               text: "Login",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   color: Theme
//                                       .of(context)
//                                       .primaryColor,
//                                   fontFamily: 'Lato',
//                                   fontSize: 16.sp),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   launchNewScreenWithNewTask(context, Routes.loginPageRoute);
//                                 },
//                             ),
//                           ],
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class VerifyInvitationArgument {
//   final InvitationResponse? invitationResponse;
//
//   VerifyInvitationArgument({this.invitationResponse});
// }
//
