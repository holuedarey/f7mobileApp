import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(image, height: 200),
          const VerticalSpace(size: 90),
          SizedBox(
            width: 200,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.backgroundColor),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.backgroundColor)),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
