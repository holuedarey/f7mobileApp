
part of 'cart_cubit.dart';


abstract class CartState extends Equatable {
  const CartState([List props = const []]);
}

class CartInitialisedState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccessfulState extends CartState {
  final dynamic carts;
  const CartSuccessfulState({required this.carts});

  @override
  List<Object> get props => [];
}

class CartFailedState extends CartState {
  final String? message;
  const CartFailedState({this.message});

  @override
  List<Object> get props => [];
}