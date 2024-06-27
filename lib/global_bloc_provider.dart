import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'blocs/authentication/authentication_event.dart';
import 'blocs/theme_app/theme_app_cubit.dart';

class GlobalBlocProvider extends StatelessWidget {
  final Widget child;

  const GlobalBlocProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) {
            return AuthenticationBloc(context)
              ..add(AuthenticationEventAppStated());
          },
        ),
        // BlocProvider(create: (_) => ExploreBloc()),
        BlocProvider<ThemeAppCubit>(
          create: (context) {
            return ThemeAppCubit()..getCurrentTheme();
          },
        ),
        // BlocProvider(create: (_) => GoalTypeBloc()),

        // BlocProvider<LoadingCubit>(
        //   create: (_) => LoadingCubit(),
        // ),
      ],
      child: child,
    );
  }
}
