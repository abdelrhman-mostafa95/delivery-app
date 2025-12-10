import 'package:flutter/material.dart';
import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double borderRadius;
  final Gradient? gradient;
  final TextStyle? textStyle;

  const GradientButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.borderRadius = 16,
    this.gradient,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.gradientFirstColor, AppColors.gradientSecondColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: Text(text),
    );
  }
}
