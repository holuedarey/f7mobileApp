import 'package:f7apparel_mobile/blocs/blocs.dart';
import 'package:f7apparel_mobile/blocs/settings/settings_bloc.dart';
import 'package:f7apparel_mobile/blocs/settings/settings_event.dart';
import 'package:f7apparel_mobile/features/landing_page.dart';
import 'package:f7apparel_mobile/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blocs/theme_app/theme_app_cubit.dart';
import 'global_bloc_provider.dart';
import 'common/theme/theme.dart';

class F7App extends StatelessWidget {
  const F7App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
      child: BlocBuilder<ThemeAppCubit, ThemeAppState>(
        builder: (context, state) {
          var currentThemeMode = ThemeMode.system;
          if (state is ThemeAppStateLight) {
            currentThemeMode = ThemeMode.light;
          }
          if (state is ThemeAppStateDark) {
            currentThemeMode = ThemeMode.dark;
          }
          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
              child: ScreenUtilInit(
                designSize: const Size(360, 780),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    themeMode: currentThemeMode,
                    darkTheme: AppTheme.dark,
                    theme: AppTheme.light,
                    initialRoute: '/',
                    onGenerateRoute: _getRoute,
                  );
                },
              ));
        },
      ),
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  Widget builder = Container();
  bool fullscreenDialog = false;
  switch (settings.name) {
    case '/':
      builder = Scaffold(
        body: MultiBlocProvider(
          providers: <BlocProvider>[
            BlocProvider<ResultHandlerBloc>(
              create: (BuildContext context) {
                return ResultHandlerBloc(context);
              },
            )
          ],
          child: BlocProvider<SettingsBloc>(
              create: (BuildContext context) {
                return SettingsBloc()..add(SettingsEventInitialised());
              },
              child: const OnboardingScreen()
              ),
        ),
      );
      fullscreenDialog = false;
      break;
    default:
      throw Exception('F7App: Invalid route: ${settings.name}');
  }

  return MaterialPageRoute(
    builder: (_) => builder,
    fullscreenDialog: fullscreenDialog,
    settings: settings,
  );
}

class Routes {
  static const attachment = "attachment";
  static const landingPageRoute = "attachment/landing_page";
  static const loginPageRoute = "attachment/login_page";
  static const forgotPasswordRoute = "attachment/forgot_password";
  static const signupInvitationPageRoute = "attachment/signup_step_one";
  static const signUpStepTwoOTPRoute = "attachment/signup_step_two_otp";
  static const signUpStepThree = "attachment/signup_step_three";
  static const dashboardRoute = "attachment/dashboard";
  static const searchPage = "attachment/search_page";
  static const changePassword = "attachment/change_password";
  static const resetPassword = "attachment/reset_password";
  static const verifyPasswordOTP = "attachment/verify_password_otp";
  static const newIntakeRecordScreen = "attachment/new_intake_record_screen";
  static const fluidIntakeSuccess = "attachment/fluid_intake_success";
  static const intakeGoalScreen = "attachment/intake_goal_screen";
  static const addIntakeGoal = "attachment/add_intake_goal";
  static const intakeGoalSuccess = "attachment/intake_goal_success";
  static const fluidHistoryScreen = "attachment/fluid_history_screen";
  static const changePasswordRoute = "attachment/change_password";
  static const resetPasswordRoute = "attachment/reset_password";
  static const verifyPasswordOTPRoute = "attachment/verify_password_otp";
  static const createAccountRoute = "attachment/createAccount";
  static const signUpEmailPasswordRoute = "attachment/signUpEmailPassword";
  static const createAccessPinRoute = "attachment/createAccessPin";
  static const confirmAccessPinRoute = "attachment/confirmAccessPine";
  static const fluidIntakeListRoute = "attachment/fluidIntakeListScreen";
  static const shiftManagerscreen = "attachment/shift_manager_screen";
  static const useShiftPatternScreen = "attachment/use_shift_pattern_screen";

  static const shiftManagerSuccess = "attachment/shiftd_manager_success";
  static const doDailyFormScreen = "attachment/do_daily_shift_form_success";
  static const createShiftSlotRoute = "attachment/createShiftSlotScreen";
  static const createShiftSlotSuccessRoute =
      "attachment/createShiftSlotSuccessScreen";
  static const updateShiftSlotSuccessRoute =
      "attachment/updateShiftSlotSuccessScreen";
  static const createShiftPatternSuccessRoute =
      "attachment/createShiftPatternSuccessScreen";
  static const createShiftPatternRoute = "attachment/createShiftPatternScreen";
  static const shiftPatternHistoryRoute =
      "attachment/shiftPatternHistoryScreen";
  static const shiftSlotHistoryRoute = "attachment/shiftSlotHistoryScreen";
  static const shiftHistoryRoute = "attachment/shiftHistoryScreen";
  static const createShiftSuccessRoute = "attachment/createShiftSuccessScreen";
  static const editSlotRoute = "attachment/editSlotPage";
  static const manageJournalRoute = "attachment/manageJournalScreen";
  static const deleteShiftScheduleRoute =
      "attachment/deleteShiftScheduleScreen";
  static const deleteShiftRangeSuccessRoute =
      "attachment/deleteShiftRangeSuccessScreen";
  static const upcomingShiftRoute = "attachment/upcomingShiftScreen";

  static const dailyjournalEmotionsScreen =
      "attachment/daily_journal_emotions_screen";
  static const createDailyjournalScreen =
      "attachment/create_daily_journal_screen";
  static const createJournalSuccessRoute = "attachment/createJournalSuccessScreen";
  static const journalHistoryRoute = "attachment/journalHistoryScreen";
}