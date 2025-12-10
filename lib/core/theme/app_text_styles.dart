import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle _poppinsStyle({
    double? size,
    FontWeight? weight,
    Color? color,
    double height = 1.0,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle title = _poppinsStyle(
    size: 22.sp,
    weight: FontWeight.w600,
    color: AppColors.titleColor,
  );

  static TextStyle sectionTitle = _poppinsStyle(
    size: 16.sp,
    weight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle categoryElements = _poppinsStyle(
    size: 12.sp,
    weight: FontWeight.w500,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle popularPrimaryElement = _poppinsStyle(
    size: 12.sp,
    weight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle popularSecondaryElement = _poppinsStyle(
    size: 7.sp,
    weight: FontWeight.w300,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle sectionsPrice = _poppinsStyle(
    size: 14.sp,
    weight: FontWeight.w600,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle lightGrayTitle = _poppinsStyle(
    size: 10.sp,
    weight: FontWeight.w300,
    color: AppColors.textTertiaryColor,
  );

  static TextStyle detailsScreenTitle = _poppinsStyle(
    size: 16.sp,
    weight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle detailsScreenSubTitle = _poppinsStyle(
    size: 18.sp,
    weight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle detailsScreenDescription = _poppinsStyle(
    size: 11.sp,
    weight: FontWeight.w300,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle buttonTitle = _poppinsStyle(
    size: 18.sp,
    weight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle detailsScreenPrice = _poppinsStyle(
    size: 30.sp,
    weight: FontWeight.w600,
    color: Colors.white,
  );
}
