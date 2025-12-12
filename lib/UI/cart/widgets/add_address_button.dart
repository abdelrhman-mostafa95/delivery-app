import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AddAddressButton({super.key, this.onTap});
  static final double _buttonSize = 48.w;
  static final double _borderWidth = 2.w;
  static final double _borderRadius = 50.r;
  static final double _iconSize = 24.sp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _buttonSize,
        height: _buttonSize,
        decoration: BoxDecoration(
          color: AppColors.titleColor,
          border: Border.all(color: AppColors.titleColor, width: _borderWidth),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Icon(Icons.add, color: Colors.white, size: _iconSize),
      ),
    );
  }
}
