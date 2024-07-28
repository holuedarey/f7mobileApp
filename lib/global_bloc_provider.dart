import 'package:f7apparel_mobile/blocs/product/listing/product_list_bloc.dart';
import 'package:f7apparel_mobile/blocs/product/search/search_bloc.dart';
import 'package:f7apparel_mobile/services/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'blocs/authentication/authentication_event.dart';
import 'blocs/theme_app/theme_app_cubit.dart';


import 'package:equatable/equatable.dart';
import 'package:tuple/tuple.dart';

import '../../models/journal/get_icons_response.dart';


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
        BlocProvider(create: (_) => IconsCubit()),
        BlocProvider(create: (_) => ProductListingBloc()),
        BlocProvider(create: (_) => SearchBloc()),

        // BlocProvider<LoadingCubit>(
        //   create: (_) => LoadingCubit(),
        // ),
      ],
      child: child,
    );
  }
}


class IconsCubit extends Cubit<IconsState> {
  IconsCubit() : super(IconsInitial());


  Future<void> fetchIconsRequest() async {
    emit(IconsLoading());
    Tuple2<List<Emotions>?, String?> response = await JournalService.getIconsRequest();
    if (response.item1 != null) {
      emit(IconsLoaded(iconsList: response.item1!));
    } else {
      emit(IconsError(response.item2 ?? "An error occurred"));
    }
  }
}



abstract class IconsState extends Equatable {
  const IconsState();

  @override
  List<Object> get props => [];
}

class IconsInitial extends IconsState {}

class IconsLoading extends IconsState {}

class IconsLoaded extends IconsState {
  final List<Emotions> iconsList;
  const IconsLoaded({required this.iconsList});
}

class IconsError extends IconsState {
  final String message;
  const IconsError(this.message);
}




