import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_nav_item.dart';

class NavbarItem extends StatelessWidget {
  final BottomNavItem item;

  final bool isSelected;

  final VoidCallback onTap;

  const NavbarItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  static const double _splashRadius = 36.0;
  static const double _verticalPadding = 14.0;
  static const double _unselectedOpacity = 0.58;

  static const Color _splashColor = Color(0xFF5117AC);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkResponse(
        onTap: onTap,
        splashColor: _splashColor.withOpacity(0.12),
        highlightShape: BoxShape.rectangle,
        radius: _splashRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: _verticalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                item.icon,
                size: 24.r,
                color: isSelected
                    ? item.activeColor
                    : item.activeColor.withOpacity(_unselectedOpacity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
