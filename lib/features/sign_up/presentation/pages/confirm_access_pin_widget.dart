// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hantspol/common/extensions/string_extension.dart';
// import 'package:hantspol/features/sign_up/presentation/pages/create_account_profile_page.dart';
// import 'package:hantspol/widgets/back_button.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../../../../blocs/authentication/authentication_bloc.dart';
// import '../../../../blocs/authentication/authentication_event.dart';
// import '../../../../blocs/login/login_bloc.dart';
// import '../../../../blocs/login/login_bloc_State.dart';
// import '../../../../blocs/login/login_bloc_event.dart';
// import '../../../../blocs/registration/sign_up_cubit.dart';
// import '../../../../blocs/result_handler/result_handler_bloc.dart';
// import '../../../../blocs/result_handler/result_handler_event.dart';
// import '../../../../common/middlewares/tdm_storage.dart';
// import '../../../../common/middlewares/token_repository.dart';
// import '../../../../common/system_util.dart';
// import '../../../../models/registration/user_otp_response.dart';
// import '../../../../myapp.dart';
// import '../../../../widgets/buttons.dart';
// import '../../../../widgets/loader.dart';
// import '../../../../widgets/message_snackbar.dart';
// import '../../../../widgets/spacing.dart';
// import '../widgets/custom_field_code_field.dart';
//
//
// class ConfirmAccessPinScreen extends StatelessWidget {
//   final RegisterUserResponse? registerUserResponse;
//   final String? email;
//   final String? password;
//   const ConfirmAccessPinScreen({Key? key, this.registerUserResponse, this.email, this.password,}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider<LoginBloc>(
//             create: (_) => LoginBloc(),
//           ),
//           BlocProvider<SignUpCubit>(
//             create: (BuildContext context) => SignUpCubit(),
//           )
//         ],
//         child: ConfirmAccessPinWidget(registerUserResponse: registerUserResponse, email:email,password:password,));
//   }
// }
//
//
// class ConfirmAccessPinWidget extends StatefulWidget {
//
//   final RegisterUserResponse? registerUserResponse;
//   final CreateAccountResponse? createAccountResponse;
//   final String? email;
//   final String? password;
//
//   const ConfirmAccessPinWidget({Key? key, this.registerUserResponse, this.createAccountResponse, this.email, this.password}) : super(key: key);
//
//   @override
//   State<ConfirmAccessPinWidget> createState() => _ConfirmAccessPinWidgetState();
// }
//
// class _ConfirmAccessPinWidgetState extends State<ConfirmAccessPinWidget> with AutomaticKeepAliveClientMixin {
//
//   final createAccessPinFormKey = GlobalKey<FormState>();
//   final TextEditingController codeController = TextEditingController();
//
//   static const _pinCodeLength = 4;
//
//   late String passCode ;
//   late StreamController<ErrorAnimationType> errorController;
//
//   @override
//   void initState() {
//     errorController = StreamController<ErrorAnimationType>();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     errorController.close();
//     super.dispose();
//   }
//
//   void _onCreateAccessPinButtonPressed() {
//       Map<String, dynamic> parameters = {
//         'pin':passCode,
//       };
//       context.read<SignUpCubit>().createAccessPin(payload:parameters, tenantId: widget.registerUserResponse!.organizationId!, token: widget.registerUserResponse!.accessToken!);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final width = MediaQuery.of(context).size.width;
//
//
//    return  MultiBlocListener(
//       listeners: [
//         BlocListener<SignUpCubit, SignUpState>(listener: (context, state) {
//           if (state is SignUpLoadingState) {
//             Loader.show(context);
//           }
//           if (state is CreateAccessPinSuccessState) {
//
//             Map<String, dynamic> loginParams = {
//               'email': widget.email,
//               'password': widget.password,
//             };
//             BlocProvider.of<LoginBloc>(context, listen: false).add(
//               LoginEmailEventButtonPressed(context, parameters: loginParams, accessToken:widget.registerUserResponse?.accessToken),
//             );
//
//           }
//           if (state is SignUpErrorState) {
//             Loader.dismiss(context);
//             BlocProvider.of<ResultHandlerBloc>(context, listen: false).add(ResultHandlerEventShowError(message: state.message));
//           }
//
//
//         }),
//
//         BlocListener<LoginBloc, LoginBlocState>(
//           listener: (context, state) {
//             if (state is LoginStateSuccessful) {
//               BlocProvider.of<AuthenticationBloc>(context).add(
//                   AuthenticationEventSignedIn(context,
//                       accessToken: state.accessToken,
//                       email:widget.email, password:widget.password,
//                       // registerUserResponse:widget.registerUserResponse,
//                       // createAccountResponse:widget.createAccountResponse
//                   ));
//               launchNewScreenWithNewTask(context, Routes.dashboardRoute);
//
//             }
//           },
//         ),
//       ],
//       child: BlocBuilder<SignUpCubit, SignUpState>(
//         builder: (BuildContext context, SignUpState state) {
//           return Scaffold(
//               backgroundColor: Theme.of(context).colorScheme.background,
//               appBar: AppBar(
//                 leadingWidth: 80,
//                 leading: CustomBackButton(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed(Routes.loginPageRoute);
//                   },
//                 ),
//                 title: Text('App access PIN',
//                     textAlign: TextAlign.start,
//                     style: Theme.of(context).textTheme.displayLarge),
//               ),
//               body: SingleChildScrollView(
//                 padding: EdgeInsets.only(right: 4.0.w, top: 36.h),
//                 child: Form(
//                   // key: createAccessPinFormKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                         child: Text('Set your PIN',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.displayLarge),
//                       ),
//                       const VerticalSpace(size: 8.0,),
//
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                         child: Text('Create a personalised PIN code to keep the account secured.',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.headlineMedium),
//                       ),
//
//                       const VerticalSpace(size: 38.0,),
//
//                       CustomPinCodeField(
//                         padding: 18.0.w,
//                         onCompleted: (pin) {
//                           setState(() {
//                             passCode = pin;
//                           });
//                           if (pin.isNotNullAndNotEmpty) {
//                               Map<String, dynamic> parameters = {
//                                 'pin':passCode,
//                               };
//                               context.read<SignUpCubit>().createAccessPin(payload:parameters,
//                                   tenantId: widget.registerUserResponse!.organizationId!,
//                                   token: widget.registerUserResponse!.accessToken!);
//                           }
//                         },
//                       ),
//
//                       Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 22.0),
//                         padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 14.0),
//                         width: width,
//                         decoration: BoxDecoration(
//                           color: const Color(0XFFEFF0F6),
//                           border: Border.all(width: 1,color: const Color(0XFFEFF0F6),),
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('FAQs',
//                                 textAlign: TextAlign.start,
//                                 style: Theme.of(context).textTheme.displayLarge),
//                             const VerticalSpace(size: 8.0,),
//                             Text('Why Do I Need Access Code ?',
//                                 textAlign: TextAlign.start,
//                                 style: Theme.of(context).textTheme.headlineSmall),
//                             const VerticalSpace(size: 8.0,),
//                             Text('Your account need to be kept secured and prevent access to your information',
//                                 textAlign: TextAlign.start,
//                                 style: Theme.of(context).textTheme.titleSmall),
//                           ],),
//                       ),
//                       const VerticalSpace(size: 42.0,),
//
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding:
//                               const EdgeInsets.symmetric(horizontal: 12.0),
//                               child: BigButton(
//                                 text: "Submit",
//                                 backgroundColor: const Color(0xFF007BFF),
//                                 textColor: Colors.white,
//                                 onPressed: _onCreateAccessPinButtonPressed ,
//                                 borderRadius: 6.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//         },
//       ),
//     );
//
//
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
//
// class ConfirmAccessPinArgument {
//   final RegisterUserResponse? registerUserResponse;
//   final String? email;
//   final String? password;
//
//   ConfirmAccessPinArgument({this.registerUserResponse,this.email, this.password,});
// }
//
