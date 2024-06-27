// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hantspol/blocs/authentication/authentication_bloc.dart';
// import 'package:hantspol/blocs/authentication/authentication_event.dart';
// import 'package:hantspol/blocs/login/login_bloc.dart';
// import 'package:hantspol/blocs/login/login_bloc_State.dart';
// import 'package:hantspol/blocs/registration/sign_up_cubit.dart';
// import 'package:hantspol/blocs/result_handler/result_handler_bloc.dart';
// import 'package:hantspol/blocs/result_handler/result_handler_event.dart';
// import 'package:hantspol/features/sign_up/presentation/pages/sign_up_email_password_page.dart';
// import 'package:hantspol/myapp.dart';
// import 'package:hantspol/common/system_util.dart';
// import 'package:hantspol/widgets/back_button.dart';
// import 'package:hantspol/widgets/buttons.dart';
// import 'package:hantspol/widgets/custom_text_form_field.dart';
// import 'package:hantspol/widgets/helper.dart';
// import 'package:hantspol/widgets/loader.dart';
// import 'package:hantspol/widgets/message_snackbar.dart';
// import 'package:hantspol/widgets/spacing.dart';
//
// import '../widgets/invitation_code_label_widget.dart';
//
//
//
// class SignUpVerifyInvitationPage extends StatelessWidget {
//   const SignUpVerifyInvitationPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme
//           .of(context)
//           .colorScheme
//           .background,
//       appBar: AppBar(
//         leadingWidth: 80,
//         leading:  CustomBackButton(onPressed:(){ Navigator.of(context).pushNamed(Routes.loginPageRoute);},),
//         title: Text('Start your journey',
//             textAlign: TextAlign.start,
//             style: Theme
//                 .of(context)
//                 .textTheme
//                 .displayLarge),
//       ),
//       body: MultiBlocProvider(providers: [
//         BlocProvider<LoginBloc>(
//           create: (_) => LoginBloc(),
//         ),
//         BlocProvider<SignUpCubit>(
//           create: (BuildContext context) => SignUpCubit(),
//         )
//       ], child: const SignUpStepOne()),
//     );
//   }
// }
//
// class SignUpStepOne extends StatefulWidget {
//   const SignUpStepOne({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpStepOne> createState() => _SignUpStepOneState();
// }
//
// class _SignUpStepOneState extends State<SignUpStepOne> {
//   final TextEditingController _invitationController = TextEditingController();
//   final _verifyInvitationFormKey = GlobalKey<FormState>();
//   bool isErrorTextVisible = false;
//   void _onVerifyInvitationButtonPressed() {
//     FocusScope.of(context).unfocus();
//     if (_verifyInvitationFormKey.currentState!.validate()) {
//       devLog("correct phone Number: ${_invitationController.text}");
//       Map<String, dynamic> parameters = {
//         'code': _invitationController.text.trim(),
//       };
//       context.read<SignUpCubit>().verifyInvitationCode(parameters);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<SignUpCubit, SignUpState>(listener: (context, state) {
//           if (state is SignUpLoadingState) {
//             Loader.show(context);
//           }
//           if (state is VerifyInviteSuccessState) {
//             Loader.dismiss(context);
//             Navigator.pushNamed(context, Routes.signUpEmailPasswordRoute,
//                 arguments: VerifyInvitationArgument(
//                   invitationResponse: state.invitationResponse,
//                 ));
//           }
//           if (state is SignUpErrorState) {
//             Loader.dismiss(context);
//             BlocProvider.of<ResultHandlerBloc>(context, listen: false).add(ResultHandlerEventShowError(message: state.message));
//           }
//         }),
//         BlocListener<LoginBloc, LoginBlocState>(
//           listener: (context, state) {
//             if (state is LoginStateLoading) {
//               Loader.show(context);
//             }
//
//             if (state is LoginStateFailed) {
//               Loader.dismiss(context);
//               HantspolSnackBar.showErrorSnackBar(context, message: state.message!);
//             }
//             if (state is LoginStateSuccessful) {
//               context.read<AuthenticationBloc>().add(
//                   AuthenticationEventSignedIn(context,
//                       accessToken: state.accessToken));
//               launchNewScreenWithNewTask(context, Routes.dashboardRoute);
//               // return;
//             }
//           },
//         ),
//       ],
//       child: BlocBuilder<SignUpCubit, SignUpState>(
//         builder: (BuildContext context, SignUpState state) {
//           return SingleChildScrollView(
//               padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, top: 36.h),
//               child: Form(
//                 key: _verifyInvitationFormKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                       child: Text('Do you have an invitation ?',
//                           textAlign: TextAlign.start,
//                           style: Theme
//                               .of(context)
//                               .textTheme
//                               .titleLarge),
//                     ),
//
//                     const VerticalSpace(size: 24),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Invitation Code',
//                             textAlign: TextAlign.start,
//                             style: Theme
//                                 .of(context)
//                                 .textTheme
//                                 .titleMedium),
//                       ),
//                       subtitle: CustomTextFormField2(
//                         controller: _invitationController,
//                         textInputAction: TextInputAction.done,
//                         label: '',
//                         hintText: 'MHKG-7920-I931',
//                         keyboardType: TextInputType.text,
//                         validator: Validators.multipleAnd([
//                           // Validators.notEmpty(fieldName: "Email"),
//                           Validators.minLength(6),
//                         ]),
//                         // maxLength: 11,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     const VerticalSpace(size: 28),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 14.0),
//                       child: Text('How to get an invitation code ',
//                           textAlign: TextAlign.start,
//                           style:
//                           Theme
//                               .of(context)
//                               .textTheme
//                               .titleLarge
//                               ?.copyWith(
//                             color: const Color(0xff151F1A),
//                           )),
//                     ),
//                     const VerticalSpace(size: 14.0),
//                     const InvitationCodeLabelWidget(label:'Reach out to your supervisor and express your interest in embracing a healthier lifestyle with HantsPol App'),
//                     const VerticalSpace(size: 14.0),
//                     const InvitationCodeLabelWidget(label:'Ask for your personalized invitation code to kickstart your wellness journey.'),
//                     const VerticalSpace(size: 14.0),
//                     const InvitationCodeLabelWidget(label:'Once you have the code, experience a world of mindfulness, fitness, and positivity right at your fingertips.'),
//                      VerticalSpace(size: MediaQuery.of(context).size.height * 0.14),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding:
//                             const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: BigButton(
//                               text: "Proceed to Continue",
//                               backgroundColor: const Color(0xFF007BFF),
//                               textColor: Colors.white,
//                               onPressed: _onVerifyInvitationButtonPressed,
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
//               ));
//         },
//       ),
//     );
//   }
// }
