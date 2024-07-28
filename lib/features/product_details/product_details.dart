import 'package:f7apparel_mobile/common/extensions/string_extension.dart';
import 'package:f7apparel_mobile/features/common/app_bar.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/feature_product.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/section_title.dart';
import 'package:f7apparel_mobile/features/product_details/widgets/Image_gallery/product_gallery.dart';
import 'package:f7apparel_mobile/features/product_details/widgets/accordion/product_accordion.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:f7apparel_mobile/widgets/buttons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

import '../../models/product_list/product_list.dart';
import '../../widgets/back_button.dart';
import '../common/basket_icon.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    print(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final btnWidth = MediaQuery.of(context).size.width * 0.98;
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: CustomBackButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.dashboardRoute);
            },
          ),
          title: const AppBarHeader(isLogo: false, title: "Shop"),
          centerTitle: false,
          actions: const [BasketIcon()],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFEFEFEF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProductGallery(
                  productImages: widget.product.images!,
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget.product.name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "£",
                            style: Theme.of(context).textTheme.headlineSmall),
                        TextSpan(
                          text: widget.product.price!.isNotEmpty
                              ? widget.product.price!.formatNumberWithComma()
                              : '0.00',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontFamily: 'WokSans',
                              fontSize: 16),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: const BigButton(
                    borderRadius: 0,
                    text: "ADD TO BAG",
                    backgroundColor: Colors.black,
                    onPressed: null,
                    height: 51.0,
                    borderOutlineColor: Colors.black,
                    width: 230,
                    elevation: 2,
                    padding: EdgeInsets.all(0),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 30,
                  margin: const EdgeInsets.only(left: 13),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFCE7BB),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 3),
                        child: const Icon(
                          Icons.access_alarm,
                          size: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text("Estimated delivery time",
                          style: Theme.of(context).textTheme.bodyLarge),
                      const Spacer(),
                      Text("July 10 - July 15",
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.only(left: 0),
                  child: ProductAccordion(
                    description: widget.product.description!,
                    productDetails: widget.product.shortDescription!,
                    ratingStar: widget.product.averageRating!,
                    reviewCount: widget.product.reviewCount!
                  ),
                ),
                const SectionTitle(title: "Related products"),
                const FeaturedProducts(),
              ],
            ),
          ),
        ));
  }
}

class ProductDetailsArgument {
  final ProductModel product;

  ProductDetailsArgument({required this.product});
}
