import 'package:bloc/bloc.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_event.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_state.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/services/product_service.dart';
import 'package:tuple/tuple.dart';

class ProductListingBloc extends Bloc<GetProductListing, ProductListingState>{
  ProductListingBloc() : super(ProductListingStateInitialised()){
    on<GetProductListing>((event, emit) async {
      emit(ProductListingStateLoading());
      try {
        Tuple2<List<ProductModel>?, String?> response = await ProductService.getProductList(event.context, parameters: event.parameters,);

        if (response.item1 != null) {
          var products = response.item1!;
          emit(ProductListingStateSuccessful(products: products));
        } else {
          emit(ProductListingStateFailed(message: response.item2));
        }
      } catch (e) {
        emit(const ProductListingStateFailed(message: "Something went wrong!"));
      }
    });
  }




}