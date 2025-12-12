import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/features/details_screen/data/details_data.dart';
import 'package:delivery_app/features/details_screen/widgets/ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsContent extends StatelessWidget {
  final String description;
  final int ingredientCount;

  const DetailsContent({
    super.key,
    required this.description,
    required this.ingredientCount,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 49.w, top: 40.h, bottom: 100.h),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Descripción", style: AppTextStyles.detailsScreenSubTitle),
            SizedBox(height: 12.h),
            Text(
              description,
              style: AppTextStyles.detailsScreenDescription.copyWith(
                height: 1.6,
                color: AppColors.textSecondaryColor,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ingredientes",
                  style: AppTextStyles.detailsScreenSubTitle,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 32.w),
                  child: Text(
                    "$ingredientCount ingredientes",
                    style: AppTextStyles.lightGrayTitle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 188.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DetailsData.ingredientImages.length,
                itemBuilder: (context, index) {
                  return IngredientItem(
                    imagePath: DetailsData.ingredientImages[index],
                    name: DetailsData.ingredientNames[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
