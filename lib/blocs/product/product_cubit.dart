import 'package:bloc/bloc.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/models/product_list/top_brand.dart';
import 'package:f7apparel_mobile/services/product_service.dart';
import 'package:tuple/tuple.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f7apparel_mobile/models/registration/user_otp_response.dart';
import 'package:f7apparel_mobile/services/identity_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialisedState());



  void getArrivalProduct(Map<String, dynamic> payload) async {
    emit(ProductLoadingState());
    try {
      Tuple2<List<ProductModel>?, String?> response = await ProductService.getArrivalProductList(parameters:payload,);

      if (response.item1 != null) {
        emit(ProductSuccessfulState(products: response.item1!));
      } else {
        emit(ProductFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const ProductFailedState(message: "Something went wrong!"));
    }
  }

  void getTopBrand(Map<String, dynamic> payload) async {
    emit(ProductLoadingState());
    try {
      Tuple2<List<TopBrandModel>?, String?> response = await ProductService.getTopBrand(parameters:payload,);
      if (response.item1 != null) {
        emit(TopBrandSuccessfulState(topBrands: response.item1!));
      } else {
        emit(ProductFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const ProductFailedState(message: "Something went wrong!"));
    }
  }

  void getFeaturedProduct(Map<String, dynamic> payload) async {
    emit(ProductLoadingState());
    try {
      print(payload);
      Tuple2<List<ProductModel>?, String?> response = await ProductService.getFeaturedProductList(parameters:payload,);
      if (response.item1 != null) {
        emit(ProductSuccessfulState(products: response.item1!));
      } else {
        emit(ProductFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const ProductFailedState(message: "Something went wrong!"));
    }
  }

  void getRecentlyViewedProduct(Map<String, dynamic> payload) async {
    emit(ProductLoadingState());
    try {
      Tuple2<List<ProductModel>?, String?> response = await ProductService.getArrivalProductList(parameters:payload,);

      if (response.item1 != null) {
        emit(ProductSuccessfulState(products: response.item1!));
      } else {
        emit(ProductFailedState( message: response.item2 ?? 'an error occurred!!!'));
      }
    } catch (e) {
      emit(const ProductFailedState(message: "Something went wrong!"));
    }
  }




}
