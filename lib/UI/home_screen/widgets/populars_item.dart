import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onTap;
  final VoidCallback? onArrowPressed;

  const PopularsItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    this.isFavorite = false,
    this.onFavoritePressed,
    this.onTap,
    this.onArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174.w,
      height: 214.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
          ),
          Positioned(
            top: 38.h,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor.withOpacity(0.35),
                          blurRadius: 24,
                          spreadRadius: 2,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    imagePath,
                    width: 70.w,
                    height: 70.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 13.h,
            right: 14.w,
            child: GestureDetector(
              onTap: onFavoritePressed,
              child: SizedBox(
                width: 19.w,
                height: 18.h,
                child: SvgPicture.asset(
                  isFavorite
                      ? 'assets/icons/love_full.svg'
                      : 'assets/icons/love.svg',
                  width: 18.sp,
                  height: 18.sp,
                  colorFilter: ColorFilter.mode(
                    isFavorite
                        ? AppColors.buttonRedColor
                        : AppColors.textTertiaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.popularPrimaryElement,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    description,
                    style: AppTextStyles.popularSecondaryElement,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('\$$price', style: AppTextStyles.sectionsPrice),
                      GestureDetector(
                        onTap: onArrowPressed,
                        child: Container(
                          width: 29.w,
                          height: 29.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
