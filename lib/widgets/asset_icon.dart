import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetIcon extends StatelessWidget {
  /// The name of the icon as specified in the design file
  /// or in the 'assets/icons' folder.
  ///
  /// The name is case and character sensitive.
  /// The value of [icon] must not be `null`.
  final String icon;

  /// The preferred color of the icon.
  ///
  /// It defaults to the color in the current [IconTheme].
  final Color? color;

  /// The preferred size of the icon in logical pixels.
  ///
  /// It defaults to the size in the current [IconTheme].
  final double? size;

  /// Semantic label for the icon.
  ///
  /// It does not show up in the UI.
  final String? semanticLabel;

  /// Whether the icon has a dot.
  ///
  /// An example is the notification on the home screen.
  final bool hasDot;

  /// The preferred color of the dot.
  ///
  /// It will be ignored of [hasDot] is false. It defaults to
  /// [MuseColors.primary].
  final Color? dotColor;

  /// Whether to override the SVG's own colors.
  final bool overrideSVGColor;

  const AssetIcon({
    Key? key,
    required this.icon,
    this.color,
    this.size,
    this.semanticLabel,
    this.hasDot = false,
    this.dotColor,
    this.overrideSVGColor = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    IconThemeData iconTheme = IconTheme.of(context);
    double size = this.size ?? iconTheme.size ?? 16.0;
    if (hasDot == true) {
      return Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/$icon.svg",
            height: size,
            width: size,
            colorBlendMode: !overrideSVGColor ? BlendMode.dst : BlendMode.srcIn,
            color: color ?? iconTheme.color,
            semanticsLabel: semanticLabel,
          ),
          Positioned(
            top: 1,
            right: 2,
            height: size / 3,
            width: size / 3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor ?? Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      );
    }
    return SvgPicture.asset(
      "assets/icons/$icon.svg",
      height: size,
      width: size,
      color: color ?? iconTheme.color,
      colorBlendMode: !overrideSVGColor ? BlendMode.dst : BlendMode.srcIn,
      semanticsLabel: semanticLabel,
    );
  }
}
