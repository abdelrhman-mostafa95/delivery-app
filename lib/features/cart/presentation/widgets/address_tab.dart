import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Address tab widget for selecting delivery location
class AddressTab extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  final IconData icon;
  final VoidCallback? onTap;

  const AddressTab({
    super.key,
    required this.title,
    required this.subtitle,
    this.isActive = false,
    this.icon = Icons.home_outlined,
    this.onTap,
  });

  // ============================================
  // Constants
  // ============================================
  static final double _horizontalPadding = 16.w;
  static final double _verticalPadding = 12.h;
  static final double _borderRadius = 16.r;
  static final double _iconSize = 20.sp;
  static final double _iconSpacing = 10.w;
  static final double _textSpacing = 2.h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: _verticalPadding,
        ),
        decoration: BoxDecoration(
          gradient: isActive
              ? const LinearGradient(
                  colors: [
                    AppColors.gradientFirstColor,
                    AppColors.gradientSecondColor,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: isActive ? null : Colors.white,
          border: isActive
              ? null
              : Border.all(
                  color: AppColors.textTertiaryColor.withOpacity(0.5),
                  width: 1.w,
                ),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : AppColors.textTertiaryColor,
              size: _iconSize,
            ),
            SizedBox(width: _iconSpacing),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.categoryElements.copyWith(
                    color: isActive ? Colors.white : AppColors.textPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(height: _textSpacing),
                Text(
                  subtitle,
                  style: AppTextStyles.lightGrayTitle.copyWith(
                    color: isActive
                        ? Colors.white.withOpacity(0.8)
                        : AppColors.textTertiaryColor,
                    fontSize: 8.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
