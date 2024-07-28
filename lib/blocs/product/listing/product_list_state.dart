import 'package:equatable/equatable.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';

abstract class ProductListingState extends Equatable {
  const ProductListingState([List props = const []]);
}

class ProductListingStateInitialised extends ProductListingState {
  @override
  List<Object> get props => [];
}

class ProductListingStateLoading extends ProductListingState {
  @override
  List<Object> get props => [];
}

class ProductListingStateSuccessful extends ProductListingState {
  final dynamic products;
  const ProductListingStateSuccessful({required this.products});

  @override
  List<Object> get props => [];
}
class ProductListingStateFailed extends ProductListingState {
  final String? message;
  const ProductListingStateFailed({this.message});

  @override
  List<Object> get props => [];
}