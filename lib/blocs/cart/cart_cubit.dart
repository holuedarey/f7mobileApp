import 'package:bloc/bloc.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/models/product_list/top_brand.dart';
import 'package:f7apparel_mobile/services/product_service.dart';
import 'package:tuple/tuple.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class ProductCubit extends Cubit<CartState> {
  ProductCubit() : super(CartInitialisedState());



  void getAll(Map<String, dynamic> payload) async {
    emit(CartLoadingState());
    try {
      Tuple2<List<ProductModel>?, String?> response = await ProductService.getArrivalProductList(parameters:payload,);

      if (response.item1 != null) {
        emit(CartSuccessfulState(carts: response.item1!));
      } else {
        emit(CartFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const CartFailedState(message: "Something went wrong!"));
    }
  }

  void getCartId(Map<String, dynamic> payload) async {
    emit(CartLoadingState());
    try {
      Tuple2<List<TopBrandModel>?, String?> response = await ProductService.getTopBrand(parameters:payload,);
      if (response.item1 != null) {
        emit(CartSuccessfulState(carts: response.item1!));
      } else {
        emit(CartFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const CartFailedState(message: "Something went wrong!"));
    }
  }

  void addToCart(Map<String, dynamic> payload) async {
    emit(CartLoadingState());
    try {
      Tuple2<List<ProductModel>?, String?> response = await ProductService.getFeaturedProductList(parameters:payload,);
      if (response.item1 != null) {
        emit(CartSuccessfulState(carts: response.item1!));
      } else {
        emit(CartFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const CartFailedState(message: "Something went wrong!"));
    }
  }

  void deleteFromCart(Map<String, dynamic> payload) async {
    emit(CartLoadingState());
    try {
      Tuple2<List<ProductModel>?, String?> response = await ProductService.getArrivalProductList(parameters:payload,);

      if (response.item1 != null) {
        emit(CartSuccessfulState(carts: response.item1!));
      } else {
        emit(CartFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const CartFailedState(message: "Something went wrong!"));
    }
  }

  void clearCart(Map<String, dynamic> payload) async {
    emit(CartLoadingState());
    try {
      Tuple2<List<ProductModel>?, String?> response = await ProductService.getArrivalProductList(parameters:payload,);

      if (response.item1 != null) {
        emit(CartSuccessfulState(carts: response.item1!));
      } else {
        emit(CartFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const CartFailedState(message: "Something went wrong!"));
    }
  }




}
