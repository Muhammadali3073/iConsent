import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerSpace extends StatelessWidget {
  const VerSpace(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class HorSpace extends StatelessWidget {
  const HorSpace(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.h,
    );
  }
}
