import 'package:f7apparel_mobile/blocs/product/listing/product_list_bloc.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_event.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_state.dart';
import 'package:f7apparel_mobile/blocs/product/product_cubit.dart';
import 'package:f7apparel_mobile/common/extensions/string_extension.dart';
import 'package:f7apparel_mobile/features/product_details/product_details.dart';
import 'package:f7apparel_mobile/features/shimmer_loading/shimmer_loading.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {

  @override
  void initState() {
    super.initState();
  }
  Map<String, dynamic> payload = {
    'limit': 10,
    'categories': null,
    'price' : null,
    'order' : 'DESC',

  };
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF000000);
    return BlocProvider(
        create: (context) => ProductCubit()..getFeaturedProduct({}),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is  ProductInitialisedState) {
              return Column(
                children: const [
                  ShimmerLoader(),
                  ShimmerLoader(),
                ],
              );
            } else if (state is ProductLoadingState) {
              return Column(
                children: const [
                  ShimmerLoader(),
                  ShimmerLoader(),
                ],
              );
            } else if (state is ProductSuccessfulState) {
              final List<ProductModel> products = state.products;
              return GridView.count(
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(products.length, (index) {
                  ProductModel product = products[index];
                  final name = product.name!;
                  final image = product.images!.first.src!;
                  final price =
                  product.price!.isNotEmpty ? product.price! : "0.00";
                  return Container(
                    height: 290,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 170,
                            height: 146,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  image,
                                  width: 160,
                                  height: 115,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print("Tapped a Shopping");
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE3E6E9),
                                          borderRadius: BorderRadius.circular(70),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5, height: 5,),
                                  ],
                                )
                              ],

                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.productDetailsScreen,
                                arguments:
                                ProductDetailsArgument(product: product));
                          },
                          child: Container(
                            width: 180,
                            margin: const EdgeInsets.only(left: 13),
                            child: Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 13),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "£",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                TextSpan(
                                  text: price.isNotEmpty
                                      ? price.formatNumberWithComma()
                                      : '0.00',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFamily: 'WokSans',
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            } else if (state is ProductListingStateFailed) {
              return const SizedBox.shrink();
            }
            return Container();
          },
        ));
  }
}
