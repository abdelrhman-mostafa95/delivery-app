import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarCartButton extends StatelessWidget {
  final VoidCallback? onTap;

  const NavbarCartButton({super.key, this.onTap});

  static final double _outerCircleSize = 90.r;
  static final double _innerCircleSize = 58.r;
  static final double _iconSize = 24.r;
  static final double _clipHeight = 70.r; // Cut top and bottom
  static const Color _gradientStart = Color(0xFF6C3BFF);
  static const Color _gradientEnd = Color(0xFF5117AC);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer white circle - clipped from top and bottom
        ClipRect(
          child: SizedBox(
            width: _outerCircleSize,
            height: _clipHeight,
            child: OverflowBox(
              maxHeight: _outerCircleSize,
              child: Container(
                width: _outerCircleSize,
                height: _outerCircleSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // Inner gradient circle with cart icon
        SizedBox(
          width: _innerCircleSize,
          height: _innerCircleSize,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_gradientStart, _gradientEnd],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onTap,
                child: Center(
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    size: _iconSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
