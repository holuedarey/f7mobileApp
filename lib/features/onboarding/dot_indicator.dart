import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 3 : 2,
      width: 90,
      decoration: BoxDecoration(
          color: isActive ? AppColors.secondary : AppColors.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
