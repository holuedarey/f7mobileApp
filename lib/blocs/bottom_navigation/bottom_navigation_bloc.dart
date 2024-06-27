import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(OpenHomeTabState());

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is OpenHomeTabEvent) {
      yield OpenHomeTabState();
    } else if (event is OpenWalletTabEvent) {
      yield OpenWalletTabState();
    } else if (event is OpenCreateTabEvent) {
      yield OpenCreateTabState();
    } else if (event is OpenExploreTabEvent) {
      yield OpenExploreTabState();
    } else if (event is OpenMessagesTabEvent) {
      yield OpenMessagesTabState();
    }
  }
}
