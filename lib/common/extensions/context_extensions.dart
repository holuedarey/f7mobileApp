import 'package:flutter/material.dart';

extension CustomContext on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get primaryColor => themeData.primaryColor;
  Color get cardColor => themeData.cardColor;
  Color get secondaryColor => themeData.colorScheme.secondary;
  Orientation orientation() => MediaQuery.of(this).orientation;

  double height([double percent = 1]) {
    return orientation() == Orientation.portrait
        ? MediaQuery.of(this).size.height * percent
        : MediaQuery.of(this).size.width * percent;
  }

  double width([double percent = 1]) {
    {
      return orientation() == Orientation.landscape
          ? MediaQuery.of(this).size.height * percent
          : MediaQuery.of(this).size.width * percent;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    } else {
      return "${this[0].toUpperCase()}${substring(1)}";
    }
  }

  String commalise() {
    return replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

// extension StringsExt on String {
//   bool containsIgnoreCase(String otherString) {
//     return toLowerCase().contains(otherString.toLowerCase());
//   }
//
//   bool equalsIgnoreCase(String otherString) {
//     return toLowerCase() == otherString.toLowerCase();
//   }
// }
