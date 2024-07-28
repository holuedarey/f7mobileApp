import 'package:f7apparel_mobile/blocs/product/listing/product_list_state.dart';
import 'package:f7apparel_mobile/blocs/product/product_cubit.dart';
import 'package:f7apparel_mobile/features/shimmer_loading/shimmer_loading.dart';
import 'package:f7apparel_mobile/models/product_list/top_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBrandSection extends StatefulWidget {
  const TopBrandSection({super.key});

  @override
  State<TopBrandSection> createState() => _TopBrandSectionState();
}

class _TopBrandSectionState extends State<TopBrandSection> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCubit()..getTopBrand({}),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductInitialisedState) {
              return const ShimmerLoader();
            } else if (state is ProductLoadingState) {
              return const ShimmerLoader();
            } else if (state is TopBrandSuccessfulState) {
              final List<TopBrandModel> topBrands = state.topBrands;
              return SizedBox(
                  height: 170,
                  child: ListView.builder(
                      itemCount: topBrands.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        final brand = state.topBrands[index];
                        return BrandCard(
                          title: brand.name,
                          image: brand.image,
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

class BrandCard extends StatelessWidget {
  const BrandCard({
    Key? key,
    this.primary = false,
    required this.title,
    required this.image,
  }) : super(key: key);

  final bool primary;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network("$image.png", fit: BoxFit.cover, height: 165.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ));
  }
}
