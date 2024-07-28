import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:f7apparel_mobile/common/extensions/string_extension.dart';
import 'package:f7apparel_mobile/common/extensions/widgets_extension.dart';
import 'package:f7apparel_mobile/widgets/animated_star.dart';
import 'package:flutter/material.dart';

class ProductAccordion extends StatelessWidget {
  const ProductAccordion(
      {super.key,
      required this.description,
      required this.productDetails,
      required this.ratingStar,
      required this.reviewCount});

  static const headerStyle = TextStyle(
      color: Color(0xff000000), fontSize: 13, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 13, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 13, fontWeight: FontWeight.normal, fontFamily: 'WorkSans');

  final String description;
  final String productDetails;
  final String ratingStar;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Accordion(
        headerBorderColor: Colors.white,
        headerBorderColorOpened: Colors.transparent,
        headerBorderWidth: 1,
        headerBackgroundColorOpened: Colors.white,
        contentBackgroundColor: Colors.white,
        contentBorderColor: Colors.white,
        headerBackgroundColor: Colors.white,
        contentBorderWidth: 1,
        contentHorizontalPadding: 20,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        headerBorderRadius: 5.0,
        children: [
          AccordionSection(
            isOpen: true,
            contentVerticalPadding: 10,
            header: const Text('Product Description', style: headerStyle),
            rightIcon: const Icon(
              Icons.arrow_drop_down,
              size: 20,
            ).paddingOnly(right: 5),
            content: Text(description.escapeHtmlString(), textAlign: TextAlign.start, style: contentStyle),
          ),
          AccordionSection(
            isOpen: true,
            contentVerticalPadding: 10,
            header: const Text('Product Details', style: headerStyle),
            rightIcon: const Icon(
              Icons.arrow_drop_down,
              size: 20,
            ).paddingOnly(right: 25),
            content: Text(productDetails.escapeHtmlString(), style: contentStyle),
          ),
          AccordionSection(
            isOpen: true,
            contentVerticalPadding: 0,
            header: Row(
              children: [
                Text('Reviews ($reviewCount)', style: headerStyle),
                const SizedBox(width: 10,),
                AnimatedRatingStars(
                  initialRating: double.parse(ratingStar),
                  onChanged: (rating) {
                    // setState(() {
                    //   _rating = rating;
                    // });
                  },

                  displayRatingValue: true, // Display the rating value
                  interactiveTooltips: true, // Allow toggling half-star state
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border,
                  starSize: 17.0,
                  animationDuration: const Duration(milliseconds: 500),
                  animationCurve: Curves.easeInOut,
                ),
                const SizedBox(width: 10,),
                Text(ratingStar, style: headerStyle),

              ],
            ),
            content: Container(),
          ),
        ]);
  }
}
