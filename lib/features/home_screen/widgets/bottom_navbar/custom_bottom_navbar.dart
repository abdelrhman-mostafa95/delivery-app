import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final VoidCallback? onCartPressed;

  const CustomBottomNavbar({
    super.key,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 12.h,
            left: 0,
            right: 0,
            child: _NavbarBackground(
              child: Row(
                children: [
                  _NavIcon(
                    Icons.home_outlined,
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemSelected?.call(0),
                  ),
                  _NavIcon(
                    Icons.shopping_bag_outlined,
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemSelected?.call(1),
                  ),
                  SizedBox(width: 72.w),
                  _NavIcon(
                    Icons.favorite_border,
                    isSelected: selectedIndex == 2,
                    onTap: () => onItemSelected?.call(2),
                  ),
                  _NavIcon(
                    Icons.person_outline,
                    isSelected: selectedIndex == 3,
                    onTap: () => onItemSelected?.call(3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            child: _CartButton(onTap: onCartPressed),
          ),
        ],
      ),
    );
  }
}

class _NavbarBackground extends StatelessWidget {
  final Widget child;

  const _NavbarBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const _NavIcon(this.icon, {this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Icon(
            icon,
            size: 24.r,
            color: isSelected ? const Color(0xFF19C1B4) : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _CartButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.r,
        height: 90.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            width: 58.r,
            height: 58.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6C3BFF), Color(0xFF5117AC)],
              ),
            ),
            child: Icon(
              Icons.shopping_basket_outlined,
              size: 30.r,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
