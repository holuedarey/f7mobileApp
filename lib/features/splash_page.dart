import 'package:flutter/material.dart';
import 'package:f7apparel_mobile/widgets/app_images.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        alignment: Alignment.center,
        color: const Color(0Xff000000),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                VerticalSpace(
                  size: height * 0.34,
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 65),
                  child: Image.asset(
                    AppImages.splashHantspot,
                    fit: BoxFit.cover,
                  ),
                ),
                VerticalSpace(
                  size: height * 0.4,
                ),
              ],
            ),
          ),
        ));
  }
}
