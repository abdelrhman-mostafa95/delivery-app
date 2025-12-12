import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData icon;
  final Color activeColor;

  final Color inactiveColor;

  const BottomNavItem({
    required this.icon,
    required this.activeColor,
    Color? inactiveColor,
  }) : inactiveColor = inactiveColor ?? const Color(0xFFB0B0B0);
}

class BottomNavItems {
  BottomNavItems._();

  static const List<BottomNavItem> items = [
    BottomNavItem(icon: Icons.home_outlined, activeColor: Color(0xFF19C1B4)),
    BottomNavItem(icon: Icons.shopping_bag, activeColor: Color(0xFFB0B0B0)),
    BottomNavItem(icon: Icons.favorite_border, activeColor: Color(0xFFB7B7B7)),
    BottomNavItem(icon: Icons.person_outline, activeColor: Color(0xFFB0B0B0)),
  ];
}
