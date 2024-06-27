// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hantspol/features/sign_up/presentation/pages/confirm_access_pin_widget.dart';
// import 'package:hantspol/features/sign_up/presentation/pages/create_access_pin_widget.dart';
// import 'package:hantspol/myapp.dart';
// import 'package:hantspol/widgets/back_button.dart';
// import 'package:hantspol/widgets/buttons.dart';
// import 'package:hantspol/widgets/custom_text_form_field.dart';
// import 'package:hantspol/widgets/helper.dart';
//
// import '../../../../blocs/registration/sign_up_cubit.dart';
// import '../../../../blocs/result_handler/result_handler_bloc.dart';
// import '../../../../blocs/result_handler/result_handler_event.dart';
// import '../../../../common/system_util.dart';
// import '../../../../models/registration/user_otp_response.dart';
// import '../../../../widgets/loader.dart';
// import '../../../../widgets/spacing.dart';
//
// class CreateAccountProfileScreen extends StatelessWidget {
//   final RegisterUserResponse? registerUserResponse;
//   final InvitationResponse? invitationResponse;
//   final String? email;
//   final String? password;
//   const CreateAccountProfileScreen({Key? key, this.registerUserResponse, this.email, this.password, this.invitationResponse,}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider<SignUpCubit>(
//             create: (BuildContext context) => SignUpCubit(),
//           )
//         ],
//         child: CreateAccountProfileWidget(registerUserResponse: registerUserResponse, email:email,password: password,));
//   }
// }
//
//
//
// class CreateAccountProfileWidget extends StatefulWidget {
//   final RegisterUserResponse? registerUserResponse;
//   final String? email;
//   final String? password;
//   const CreateAccountProfileWidget({Key? key, this.registerUserResponse, this.email, this.password}) : super(key: key);
//
//   @override
//   State<CreateAccountProfileWidget> createState() =>
//       _CreateAccountProfileWidgetState();
// }
//
// class _CreateAccountProfileWidgetState extends State<CreateAccountProfileWidget> {
//   final signUpAccountProfileFormKey = GlobalKey<FormState>();
//   final TextEditingController _heightController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   bool isErrorTextVisible = false;
//   bool? isRememberMe = false;
//   bool isPasswordObscure = true;
//   bool isConfirmPasswordObscure = true;
//
//   String _startDate = '';
//
//   String get startDate => _startDate;
//
//   Future<void> selectStartDate(BuildContext context) async {
//     final DateTime? d = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1000),
//       lastDate: DateTime(2100),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: const Color(0xFF007BFF),
//             colorScheme: const ColorScheme.light(primary: Color(0xFF007BFF)),
//             buttonTheme: const ButtonThemeData(
//                 textTheme: ButtonTextTheme.primary
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//
//     if (d != null) {
//       setState(() {
//         _startDate = '${d.day}-${d.month.toString().length > 1 ? d.month : '0${d.month}'}-${d.year}';
//       });
//     }
//   }
//
//
//   void _onCreateAccountProfileButtonPressed() {
//     FocusScope.of(context).unfocus();
//     if (signUpAccountProfileFormKey.currentState!.validate()) {
//       print("MyData:${ widget.registerUserResponse}");
//       Map<String, dynamic> parameters = {
//         'first_name':_firstNameController.text,
//         'last_name': _lastNameController.text,
//         // 'date_of_birth': _startDate,
//         'date_of_birth': "2024-01-01",
//         'height': _heightController.text,
//         'weight': _weightController.text,
//       };
//       context.read<SignUpCubit>().createAccountProfile(payload:parameters, tenantId: widget.registerUserResponse!.organizationId!, token: widget.registerUserResponse!.accessToken!,);
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<SignUpCubit, SignUpState>(listener: (context, state) {
//           if (state is SignUpLoadingState) {
//             Loader.show(context);
//           }
//           if (state is CreateAccountProfileSuccessState) {
//             Loader.dismiss(context);
//             Navigator.pushNamed(context, Routes.confirmAccessPinRoute,
//                 arguments: ConfirmAccessPinArgument(
//                   registerUserResponse: widget.registerUserResponse,
//                     email:widget.email,
//                      password: widget.password
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
//               title: Text('Create Account',
//                   textAlign: TextAlign.start,
//                   style: Theme.of(context).textTheme.displayLarge),
//             ),
//             body: SingleChildScrollView(
//               padding: EdgeInsets.only(right: 4.0.w, top: 36.h),
//               child: Form(
//                 key: signUpAccountProfileFormKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Text('Let’s get you started',
//                           textAlign: TextAlign.start,
//                           style: Theme.of(context).textTheme.titleLarge),
//                     ),
//                     const VerticalSpace(size: 24),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('First Name',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle: CustomTextFormField2(
//                         controller: _firstNameController,
//                         textInputAction: TextInputAction.done,
//                         label: '',
//                         hintText: 'john',
//                         keyboardType: TextInputType.name,
//                         validator: Validators.multipleAnd([
//                           // Validators.notEmpty(fieldName: "Email"),
//                           // Validators.minLength(11),
//                         ]),
//                         // maxLength: 11,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     const VerticalSpace(size: 8.0),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Last Name',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle: CustomTextFormField2(
//                         controller: _lastNameController,
//                         textInputAction: TextInputAction.done,
//                         label: '',
//                         hintText: 'doe',
//                         keyboardType: TextInputType.name,
//                         validator: Validators.multipleAnd([
//                           // Validators.notEmpty(fieldName: "Email"),
//                           // Validators.minLength(11),
//                         ]),
//                         // maxLength: 11,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     const VerticalSpace(size: 8.0),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Date of Birth',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle:   GestureDetector(
//                         onTap: () => selectStartDate(context),
//                         child: Container(
//                           padding:
//                           const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
//                           decoration: BoxDecoration(
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(8.0)),
//                               border: Border.all(color: const Color(0xff3E4352), width: 1.2,)
//
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Flexible(
//                                     child: Text(
//                                       startDate == '' ? '23-12-2023' : startDate,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 14,
//                                         color: Color(0xff3E4352),
//                                       ),
//                                     ),
//                                   ),
//                                   const Icon(
//                                     Icons.calendar_today_outlined,
//                                     size: 18,
//                                     color: Colors.black,
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const VerticalSpace(size: 8.0),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Weight',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle: CustomTextFormField2(
//                         controller: _weightController,
//                         textInputAction: TextInputAction.done,
//                         label: '',
//                         hintText: '69.5 kg',
//                         keyboardType: TextInputType.number,
//                         validator: Validators.multipleAnd([
//                           // Validators.notEmpty(fieldName: "Email"),
//                           // Validators.minLength(11),
//                         ]),
//                         // maxLength: 11,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     const VerticalSpace(size: 8.0),
//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Height',
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                       subtitle: CustomTextFormField2(
//                         controller: _heightController,
//                         textInputAction: TextInputAction.done,
//                         label: '',
//                         hintText: '179 cm',
//                         keyboardType: TextInputType.number,
//                         validator: Validators.multipleAnd([
//                           // Validators.notEmpty(fieldName: "Email"),
//                           // Validators.minLength(11),
//                         ]),
//                         // maxLength: 11,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     const VerticalSpace(size: 24),
//
//
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding:
//                             const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: BigButton(
//                               text: "Create Profile",
//                               backgroundColor: const Color(0xFF007BFF),
//                               textColor: Colors.white,
//                               onPressed: _onCreateAccountProfileButtonPressed,
//                               borderRadius: 6.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const VerticalSpace(size: 24),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding:
//                             const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: BigButton(
//                               text: "Cancel",
//                               // backgroundColor: const Color(0xFF007BFF),
//                               backgroundColor: Colors.white,
//                               borderOutlineColor: const Color(0xFF007BFF),
//                               textColor: const Color(0xFF007BFF),
//                               onPressed:(){
//                                 launchNewScreenWithNewTask(context, Routes.loginPageRoute);
//                               },
//                               borderRadius: 6.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const VerticalSpace(size: 24),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//        
//   }
// }
//
//
// class CreateAccountProfileArgument {
//   final InvitationResponse? invitationResponse;
//   final RegisterUserResponse? registerUserResponse;
// final String? email;
// final String? password;
//   CreateAccountProfileArgument( {this.registerUserResponse,this.invitationResponse,this.email, this.password});
// }
//
