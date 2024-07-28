import 'package:f7apparel_mobile/blocs/product/listing/product_list_bloc.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_event.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_state.dart';
import 'package:f7apparel_mobile/common/extensions/string_extension.dart';
import 'package:f7apparel_mobile/features/product_details/product_details.dart';
import 'package:f7apparel_mobile/features/shimmer_loading/shimmer_loading.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentViewProducts extends StatefulWidget {
  const RecentViewProducts({super.key});

  @override
  State<RecentViewProducts> createState() => _RecentViewProductsState();
}

class _RecentViewProductsState extends State<RecentViewProducts> {
  final ProductListingBloc _productBloc = ProductListingBloc();

  @override
  void initState() {
    _productBloc.add(GetProductListing(context, parameters: {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF000000);
    return BlocProvider(
        create: (context) => _productBloc,
        child: BlocBuilder<ProductListingBloc, ProductListingState>(
          builder: (context, state) {
            if (state is ProductListingStateInitialised) {
              return Column(
                children: const [
                  ShimmerLoader(),
                  ShimmerLoader(),
                ],
              );
            } else if (state is ProductListingStateLoading) {
              return Column(
                children: const [
                  ShimmerLoader(),
                  ShimmerLoader(),
                ],
              );
            } else if (state is ProductListingStateSuccessful) {
              return AspectRatio(
                aspectRatio: 3 / 5.5,
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(state.products.length, (index) {
                    ProductModel product = state.products[index];
                    final name = product.name!;
                    final image = product.images!.first.src!;
                    final price =
                        product.price!.isNotEmpty ? product.price! : "0.00";
                    return Container(
                      height: 280,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 170,
                              height: 135,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    image,
                                    width: 160,
                                    height: 130,
                                  )
                                ],
                              )),
                          SizedBox(
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
                ),
              );
            } else if (state is ProductListingStateFailed) {
              return const SizedBox.shrink();
            }
            return Container();
          },
        ));
  }
}
