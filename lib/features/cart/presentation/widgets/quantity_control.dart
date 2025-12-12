import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Quantity control widget with decrement and increment buttons
class QuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  const QuantityControl({
    super.key,
    required this.quantity,
    this.onDecrement,
    this.onIncrement,
  });

  // ============================================
  // Constants
  // ============================================
  static final double _buttonSize = 24.w;
  static final double _buttonRadius = 6.r;
  static final double _iconSize = 14.sp;
  static final double _horizontalPadding = 8.w;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButton(icon: Icons.remove, onTap: onDecrement),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
          child: Text(
            '$quantity',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.gradientSecondColor,
            ),
          ),
        ),
        _buildButton(icon: Icons.add, onTap: onIncrement),
      ],
    );
  }

  Widget _buildButton({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _buttonSize,
        height: _buttonSize,
        decoration: BoxDecoration(
          color: AppColors.gradientSecondColor,
          borderRadius: BorderRadius.circular(_buttonRadius),
        ),
        child: Icon(icon, color: Colors.white, size: _iconSize),
      ),
    );
  }
}
