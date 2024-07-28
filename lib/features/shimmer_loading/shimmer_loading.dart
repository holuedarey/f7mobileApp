import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHorizontal extends StatelessWidget {
  final double? width;
  final double? height;

  const ShimmerHorizontal({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: 3,
        // Adjust the count based on your needs
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              height: height ?? 20,
              width: width ?? 200,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  final double? width;
  final double? height;

  const ShimmerList({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 5, // Adjust the count based on your needs
        itemBuilder: (context, index) {
          return Container(
            height: 90,
            width: 170,
            color: Colors.black,
            margin: const EdgeInsets.all(10),
          );
        },
      ),
    );
  }
}

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 90,
                width: 150,
                color: Colors.black,
                margin: const EdgeInsets.all(10),
              ),
              Container(
                height: 90,
                width: 150,
                color: Colors.black,
                margin: const EdgeInsets.all(10),
              ),
            ],
          ),
        ));
  }
}
