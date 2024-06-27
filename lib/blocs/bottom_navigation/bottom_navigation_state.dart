part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class OpenHomeTabState extends BottomNavigationState {}

class OpenWalletTabState extends BottomNavigationState {}

class OpenCreateTabState extends BottomNavigationState {}

class OpenExploreTabState extends BottomNavigationState {}

class OpenMessagesTabState extends BottomNavigationState {}

class DailyJournalTabState extends BottomNavigationState {}
