
// Extension on num
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtension on num {
  // Transform any number to sizedbox for easy spacing vertically
  SizedBox toColumnSpace() => SizedBox(height: toDouble().h,);
  // Transform any number to sizedbox for easy spacing horizontally
  SizedBox toRowSpace() => SizedBox(width: toDouble().w,);
  // Transform any number to sizedbox for easy spacing horizontally
  // String padWithZero() => (toString().length > 1) ? toString() : "0${toString()}";
  String padWithZero() => (toString().length > 1) ? toString() : "0${toString()}";

  double get rw => w;
  double get rh => h;
  double get rsp => sp;
}