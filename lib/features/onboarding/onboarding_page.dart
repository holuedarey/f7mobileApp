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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(image, height: 250),
            const VerticalSpace(size: 20),
            SizedBox(
              width: 200,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.backgroundColor),
              ),
            ),
            const VerticalSpace(size: 10),
            SizedBox(
              width: 240,
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.backgroundColor,
                        fontSize: 13
                      )),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
