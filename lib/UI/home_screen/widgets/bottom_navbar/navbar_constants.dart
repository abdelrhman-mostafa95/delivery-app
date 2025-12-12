import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarConstants {
  NavbarConstants._();

  static const double barHeight = 56.0;

  static const double fabSize = 54.0;
  static double get fabGapWidth => 72.w;
  static double get horizontalMargin => 16.w;
  static double get bottomMargin => 12.h;
  static double get borderRadius => 28.r;
  static double get totalHeight => barHeight + (fabSize / 2) + 12;
  static double get cartButtonBottom => 10.h;
  static const double blurSigma = 18.0;
  static const double shadowBlurRadius = 18.0;
  static const Offset shadowOffset = Offset(0, 8);
  static const double shadowOpacity = 0.08;
  static const Color backgroundColor = Color.fromARGB(245, 245, 245, 245);
}
