import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final double? width;
  final double? height;

  const CategoryItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width ?? 85.w,
          height: height ?? 85.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: AppTextStyles.categoryElements,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
