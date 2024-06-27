part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class OpenHomeTabEvent extends BottomNavigationEvent {}

class OpenWalletTabEvent extends BottomNavigationEvent {}

class OpenCreateTabEvent extends BottomNavigationEvent {}

class OpenExploreTabEvent extends BottomNavigationEvent {}

class OpenMessagesTabEvent extends BottomNavigationEvent {}
