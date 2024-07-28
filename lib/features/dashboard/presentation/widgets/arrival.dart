import 'dart:ffi';

import 'package:f7apparel_mobile/blocs/product/listing/product_list_bloc.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_state.dart';
import 'package:f7apparel_mobile/blocs/product/listing/product_list_event.dart';
import 'package:f7apparel_mobile/common/extensions/string_extension.dart';
import 'package:f7apparel_mobile/features/forgot_password/presentation/pages/resetpassword.dart';
import 'package:f7apparel_mobile/features/shimmer_loading/shimmer_loading.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../product_details/product_details.dart';

class ArrivalSection extends StatefulWidget {
  const ArrivalSection({super.key});

  @override
  State<ArrivalSection> createState() => _ArrivalProductsState();
}

class _ArrivalProductsState extends State<ArrivalSection> {
  final ProductListingBloc _productBloc = ProductListingBloc();

  @override
  void initState() {
    _productBloc.add(GetProductListing(context, parameters: {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _productBloc,
        child: BlocBuilder<ProductListingBloc, ProductListingState>(
          builder: (context, state) {
            if (state is ProductListingStateInitialised) {
              return  const ShimmerLoader();
            } else if (state is ProductListingStateLoading) {
              return  const ShimmerLoader();
            } else if (state is ProductListingStateSuccessful) {
              return SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: state.products.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        ProductModel product = state.products[index];
                        return _SuggestionCard(
                          product: product,
                          title: product.name!,
                          amount: product.price!,
                          image: product.images!.first.src!,
                        );
                      }));
            } else if (state is ProductListingStateFailed) {
              return const SizedBox.shrink();
            }
            return Container();
          },
        ));
  }
}

class _SuggestionCard extends StatelessWidget {
  const _SuggestionCard({
    Key? key,
    this.primary = false,
    required this.title,
    required this.amount,

   required this.image,
   required  this.product,
  }) : super(key: key);

  final bool primary;
  final String title;
  final String amount;
  final String image;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF000000);
    return AspectRatio(
      aspectRatio: 3.2 / 5.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: primary ? primaryColor : const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 148,
                  width: 131,
                  child: Center(
                      child: Image.network(image, fit: BoxFit.cover, )),
                ),
                const SizedBox(height: 5),
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
                          Icons.shopping_bag_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Routes.productDetailsScreen,
                  arguments: ProductDetailsArgument(product: product));
            },
            child: Container(
              width: 180,
              margin: const EdgeInsets.only(left: 13),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: primary ? Colors.white : primaryColor,
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
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextSpan(
                    text: amount.isNotEmpty ? amount.formatNumberWithComma() : '0.00',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontFamily: 'WokSans',
                        fontSize: 16),

                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
