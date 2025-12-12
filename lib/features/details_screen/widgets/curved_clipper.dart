import 'package:flutter/material.dart';

class SmoothBottomRightClipper extends CustomClipper<Path> {
  final double curveHeight;
  final double curveOvershoot;

  SmoothBottomRightClipper({this.curveHeight = 0, this.curveOvershoot = 0});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - curveHeight);

    path.quadraticBezierTo(
      size.width,
      size.height,
      -curveOvershoot,
      size.height,
    );

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
