import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecomendadosItem extends StatelessWidget {
  final String imagePath;
  final String category;
  final String title;
  final String description;
  final String price;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onTap;

  const RecomendadosItem({
    super.key,
    required this.imagePath,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    this.isFavorite = false,
    this.onFavoritePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 240.w,
        height: 110.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 240.w,
              height: 108.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: const Color(0xFFF5F5F7), width: 1.w),
              ),
            ),
            Positioned(
              top: 8.h,
              left: 98.w,
              right: 12.w,
              bottom: 8.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(category, style: AppTextStyles.lightGrayTitle),
                      GestureDetector(
                        onTap: onFavoritePressed,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          size: 18.sp,
                          color: AppColors.buttonRedColor,
                        ),
                      ),
                    ],
                  ),
                  // Title
                  Text(title, style: AppTextStyles.recomendadosTitleElement),
                  // Description
                  Text(
                    description,
                    style: AppTextStyles.popularSecondaryElement,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('\$$price', style: AppTextStyles.sectionsPrice),
                      Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 10.sp,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 3.h,

              child: SizedBox(
                width: 98.w,
                height: 132.h,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
