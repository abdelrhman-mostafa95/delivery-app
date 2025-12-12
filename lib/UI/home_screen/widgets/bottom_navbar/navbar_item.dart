import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_nav_item.dart';

/// Individual navigation item widget for the bottom navbar
class NavbarItem extends StatelessWidget {
  /// The navigation item data
  final BottomNavItem item;

  /// Whether this item is currently selected
  final bool isSelected;

  /// Callback when the item is tapped
  final VoidCallback onTap;

  const NavbarItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  // ============================================
  // Constants
  // ============================================
  static const double _splashRadius = 36.0;
  static const double _verticalPadding = 14.0;
  static const double _unselectedOpacity = 0.58;

  // ============================================
  // Colors
  // ============================================
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
