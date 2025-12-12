import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/UI/details_screen/widgets/curved_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsHeader extends StatelessWidget {
  final String title;
  final String imagePath;

  const DetailsHeader({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: SmoothBottomRightClipper(
            curveHeight: 180.h,
            curveOvershoot: 800.w,
          ),
          child: Container(
            height: 595.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 81.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 69.w),
                Text(title, style: AppTextStyles.detailsScreenTitle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
