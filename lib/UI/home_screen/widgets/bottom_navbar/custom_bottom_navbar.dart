import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final VoidCallback? onCartPressed;
  final bool isFavoriteSelected;
  final VoidCallback? onFavoriteToggle;

  const CustomBottomNavbar({
    super.key,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.onCartPressed,
    this.isFavoriteSelected = false,
    this.onFavoriteToggle,
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
                  _SvgNavIcon(
                    'assets/icons/Home.svg',
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemSelected?.call(0),
                  ),
                  _SvgNavIcon(
                    'assets/icons/box.svg',
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemSelected?.call(1),
                  ),
                  SizedBox(width: 72.w),
                  _SvgNavIcon(
                    isFavoriteSelected
                        ? 'assets/icons/love_full.svg'
                        : 'assets/icons/love.svg',
                    isSelected: selectedIndex == 2,
                    onTap: () {
                      onFavoriteToggle?.call();
                      onItemSelected?.call(2);
                    },
                  ),
                  _IconNavItem(
                    Icons.person_outline,
                    isSelected: selectedIndex == 3,
                    onTap: () => onItemSelected?.call(3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
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

class _SvgNavIcon extends StatelessWidget {
  final String assetPath;
  final bool isSelected;
  final VoidCallback? onTap;

  const _SvgNavIcon(this.assetPath, {this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 24.r,
            height: 24.r,
            colorFilter: ColorFilter.mode(
              isSelected ? const Color(0xFF19C1B4) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _IconNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const _IconNavItem(this.icon, {this.isSelected = false, this.onTap});

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
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/cart.svg',
                width: 28.r,
                height: 28.r,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
