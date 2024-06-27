import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    Key? key,
    this.color,
    this.size,
    this.weight,
    this.height,
    this.align,
    this.family,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final double? height;
  final TextAlign? align;
  final String? family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        height: height,
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.w400,
        fontFamily: family ?? "Poppins",
      ),
    );
  }
}
