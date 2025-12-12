import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBottomBar extends StatelessWidget {
  final String price;
  final String buttonText;

  const DetailsBottomBar({
    super.key,
    required this.price,
    this.buttonText = "Ordenar ahora",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 56.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.gradientFirstColor,
                    AppColors.gradientSecondColor,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Text(buttonText, style: AppTextStyles.buttonTitle),
              ),
            ),
          ),
          SizedBox(width: 24.w),
          Text(
            "\$$price",
            style: AppTextStyles.detailsScreenPrice.copyWith(
              color: AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
