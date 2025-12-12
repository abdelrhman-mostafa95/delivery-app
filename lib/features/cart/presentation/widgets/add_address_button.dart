import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Add address circular button with plus icon
class AddAddressButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AddAddressButton({super.key, this.onTap});

  // ============================================
  // Constants
  // ============================================
  static final double _buttonSize = 48.w;
  static final double _borderWidth = 2.w;
  static final double _borderRadius = 16.r;
  static final double _iconSize = 24.sp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _buttonSize,
        height: _buttonSize,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.gradientSecondColor,
            width: _borderWidth,
          ),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Icon(
          Icons.add,
          color: AppColors.gradientSecondColor,
          size: _iconSize,
        ),
      ),
    );
  }
}
