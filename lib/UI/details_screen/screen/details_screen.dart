import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/UI/details_screen/data/details_data.dart';
import 'package:delivery_app/UI/details_screen/widgets/details_bottom_bar.dart';
import 'package:delivery_app/UI/details_screen/widgets/details_content.dart';
import 'package:delivery_app/UI/details_screen/widgets/details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double headerHeight = 467.h;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DetailsHeader(
              title: DetailsData.title,
              imagePath: "assets/images/bg.png",
            ),
            Column(
              children: [
                SizedBox(height: headerHeight),
                DetailsContent(
                  description: DetailsData.description,
                  ingredientCount: DetailsData.ingredientCount,
                ),
              ],
            ),
            Positioned(
              top: headerHeight - 30.h,
              right: 24.w,
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.buttonRedColor,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: AppColors.buttonRedColor)],
                ),
                child: Icon(
                  Icons.favorite_outline_outlined,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DetailsBottomBar(price: DetailsData.price),
    );
  }
}
