import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/features/home_screen/widgets/app_bar.dart';
import 'package:delivery_app/features/home_screen/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> categoryColors = [
      AppColors.categoryGreen,
      AppColors.categoryLightGreen,
      AppColors.categoryYellow,
      AppColors.categoryPink,
      AppColors.categoryPurple,
    ];

    final List<String> categoryImages = [
      "assets/images/category-1.png",
      "assets/images/category-2.png",
      "assets/images/category-3.png",
      "assets/images/category-4.png",
      "assets/images/category-5.png",
    ];

    final List<String> categoryTitles = [
      "Tacos",
      "Frias",
      "Burger",
      "Pizza",
      "Burritos",
    ];

    return Scaffold(
      appBar: HomeAppBar(title: "Inicio"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 39.h),
            Text("Explorar categorias", style: AppTextStyles.sectionTitle),
            SizedBox(height: 14.h),
            SizedBox(
              height: 96.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryTitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 28.w),
                    child: CategoryItem(
                      title: categoryTitles[index],
                      imagePath: categoryImages[index],
                      backgroundColor: categoryColors[index],
                      width: 64.w,
                      height: 64.h,
                    ),
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
