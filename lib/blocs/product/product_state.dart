
part of 'product_cubit.dart';


abstract class ProductState extends Equatable {
  const ProductState([List props = const []]);
}

class ProductInitialisedState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductSuccessfulState extends ProductState {
  final dynamic products;
  const ProductSuccessfulState({required this.products});

  @override
  List<Object> get props => [];
}

class ProductFailedState extends ProductState {
  final String? message;
  const ProductFailedState({this.message});

  @override
  List<Object> get props => [];
}



class TopBrandSuccessfulState extends ProductState {
  final List<TopBrandModel> topBrands;
  const TopBrandSuccessfulState({required this.topBrands});

  @override
  List<Object> get props => [];
}