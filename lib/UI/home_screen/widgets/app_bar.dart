import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/UI/home_screen/widgets/search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(131.h);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            right: 31.3.h,
            top: 70.h,
            bottom: 33.8.h,
          ),
          child: Row(
            children: [
              SearchContainer(),
              SizedBox(width: 4.w),
              Text(title, style: AppTextStyles.title),
              SizedBox(width: 110.5.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/icons/noun_notification_2184935.svg',
                    width: 19.4.w,
                    height: 22.19.h,
                  ),
                  SizedBox(width: 15.56.w),
                  SvgPicture.asset(
                    'assets/icons/Grupo 2522.svg',
                    width: 21.2.w,
                    height: 21.19.h,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 0.5.h,
          decoration: BoxDecoration(
            color: AppColors.textTertiaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
