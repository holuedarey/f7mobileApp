import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:flutter/material.dart';

class ThumbNailIndicator extends StatelessWidget {
  const ThumbNailIndicator({super.key, this.isActive = false, required this.imageUrl});

  final bool isActive;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 60 : 60,
      width: isActive ? 60 : 60,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: isActive ? Colors.grey : AppColors.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Image.network(imageUrl, width: 60, height: 60,),
    );
  }
}
