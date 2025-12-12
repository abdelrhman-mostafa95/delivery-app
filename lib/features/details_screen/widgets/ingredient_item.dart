import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientItem extends StatelessWidget {
  final String imagePath;
  final String name;

  const IngredientItem({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Column(
        children: [
          Container(
            width: 91.w,
            height: 104.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
