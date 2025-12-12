import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/UI/cart/widgets/quantity_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final double price;
  final int quantity;

  const CartItemCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 220.w,
          padding: EdgeInsets.only(
            top: 24.h,
            left: 20.w,
            right: 20.w,
            bottom: 20.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.gradientSecondColor.withOpacity(0.3),
              width: 1.w,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 130.w,
                height: 130.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 130.w,
                    height: 130.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                name,
                style: AppTextStyles.sectionTitle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                description,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondaryColor,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuantityControl(quantity: quantity),
                  Text(
                    '\$${price.toInt()}',
                    style: AppTextStyles.sectionsPrice.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gradientSecondColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -8.h,
          right: -8.w,
          child: Container(
            width: 42.w,
            height: 42.w,
            decoration: const BoxDecoration(
              color: AppColors.buttonRedColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.delete_outline, color: Colors.white, size: 22.sp),
          ),
        ),
      ],
    );
  }
}
